using UnityEngine;
using System.Collections;

public class CharacterColor : MonoBehaviour {

    bool red = false;
    bool blue = false;
    bool green = false;

	// Use this for initialization
	void Start () {
	}

	void OnTriggerEnter(Collider collider) {
		if (collider.gameObject.tag == "Torch")
		{
			Torch torch = collider.gameObject.GetComponent("Torch") as Torch;

			if(torch.color == Color.red)
			{
                red = true;
			}
			if(torch.color == Color.blue)
			{
                blue = true;
			}
			if(torch.color == Color.green)
			{
                green = true;
			}

            SetCollisionLayer();
		}
	}

    void OnTriggerExit(Collider collider)
    {
        if (collider.gameObject.tag == "Torch")
        {
            Torch torch = collider.gameObject.GetComponent("Torch") as Torch;

            if (torch.color == Color.red)
            {
                red = false;
            }
            if (torch.color == Color.blue)
            {
                blue = false;
            }
            if (torch.color == Color.green)
            {
                green = false;
            }

            SetCollisionLayer();
        }
    }

    void SetCollisionLayer()
    {
        if(red && blue && green)
        {
            gameObject.layer = 16;
        }
        else if (red && blue)
        {
            gameObject.layer = 13;
        }
        else if (red && green)
        {
            gameObject.layer = 14;
        }
        else if (blue && green)
        {
            gameObject.layer = 15;
        }
        else if (red)
        {
            gameObject.layer = 8;
        }
        else if (blue)
        {
            gameObject.layer = 9;
        }
        else if (green)
        {
            gameObject.layer = 10;
        }
		else
		{
			gameObject.layer = 12;
		}
    }
}

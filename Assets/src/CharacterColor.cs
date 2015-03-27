using UnityEngine;
using System.Collections;

public class CharacterColor : MonoBehaviour {

//  public bool red = false;
//	public bool blue = false;
//	public bool green = false;

	public int redSources = 0;
	public int blueSources = 0;
	public int greenSources = 0;
	//int red = 0;
	//int blue = 0;
	//int green = 0;

	// Use this for initialization
	void Start () {
	}

	void OnTriggerEnter(Collider collider) {
		if (collider.gameObject.tag == "Torch")
		{
			Torch torch = collider.gameObject.GetComponent("Torch") as Torch;

			if(torch.color == Color.red)
			{
                //red = true;
				redSources++;
				//red++;
			}
			if(torch.color == Color.blue)
			{
                //blue = true;
				blueSources++;
				//blue++;
			}
			if(torch.color == Color.green)
			{
                //green = true;
				greenSources++;
				//green++;
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
                //red = false;
				redSources--;
				//red--;
            }
            if (torch.color == Color.blue)
            {
                //blue = false;
				blueSources--;
				//blue--;
            }
            if (torch.color == Color.green)
            {
                //green = false;
				greenSources--;
				//green--;
            }

            SetCollisionLayer();
        }
    }

    void SetCollisionLayer()
    {
		/*
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
		}*/

		if(redSources > 0 && blueSources > 0 && greenSources > 0)
		{
			gameObject.layer = 16;
		}
		else if (redSources > 0 && blueSources > 0)
		{
			gameObject.layer = 13;
		}
		else if (redSources > 0 && greenSources > 0)
		{
			gameObject.layer = 14;
		}
		else if (blueSources > 0 && greenSources > 0)
		{
			gameObject.layer = 15;
		}
		else if (redSources > 0)
		{
			gameObject.layer = 8;
		}
		else if (blueSources > 0)
		{
			gameObject.layer = 9;
		}
		else if (greenSources > 0)
		{
			gameObject.layer = 10;
		}
		else
		{
			gameObject.layer = 12;
		}
    }
}

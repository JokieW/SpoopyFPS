using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class TorchesManager : MonoBehaviour
{

    public Torch redTorch;
    public Torch blueTorch;
    public Torch greenTorch;

    public KeyCode redKeyCode;
    public KeyCode blueKeyCode;
    public KeyCode greenKeyCode;

	public KeyCode hardPickUpRed;
	public KeyCode hardPickUpBlue;
	public KeyCode hardPickUpGreen;

	public KeyCode dropKey;
	public KeyCode pickUpKey;

	private int activeTorch = -1;

	public float pickUpRange = 3.0f;

    private List<Torch> torches = new List<Torch>();

	void Awake()
	{
		torches.Add(redTorch);
		torches.Add(blueTorch);
		torches.Add(greenTorch);
	}

    void Update()
    {
        if (TorchesReady ()) {
			if (Input.GetKeyDown (redKeyCode)) {
				if (torches [0].IsOn ()) {
					torches [0].TurnOff ();
					activeTorch = -1;
				} else {
					torches [0].TurnOn ();
					activeTorch = 0;
					torches [1].TurnOff ();
					torches [2].TurnOff ();
				}
			} else if (Input.GetKeyDown (blueKeyCode)) {
				if (torches [1].IsOn ()) {
					torches [1].TurnOff ();
					activeTorch = -1;
				} else {
					torches [1].TurnOn ();
					activeTorch = 1;
					torches [0].TurnOff ();
					torches [2].TurnOff ();
				}
			} else if (Input.GetKeyDown (greenKeyCode)) {
				if (torches [2].IsOn ()) {
					torches [2].TurnOff ();
					activeTorch = -1;
				} else {
					torches [2].TurnOn ();
					activeTorch = 2;
					torches [0].TurnOff ();
					torches [1].TurnOff ();
				}
			} else if (Input.GetKeyDown (dropKey)) {
				if (activeTorch != -1) {
					Drop (activeTorch);
				}
			} else if (Input.GetKeyDown (pickUpKey)) {
				PickUp ();
			} else if (Input.GetKeyDown (hardPickUpRed)) {
				activeTorch = -1;
				redTorch.TurnOff();
				redTorch.PickUp(this.transform);
				redTorch.TurnOff();
			} else if (Input.GetKeyDown (hardPickUpBlue)) {
				activeTorch = -1;
				blueTorch.TurnOff();
				blueTorch.PickUp(this.transform);
				blueTorch.TurnOff();
			} else if (Input.GetKeyDown (hardPickUpGreen)) {
				activeTorch = -1;
				greenTorch.TurnOff();
				greenTorch.PickUp(this.transform);
				greenTorch.TurnOff();
			}
		}
    }

	public void Drop(int torch)
	{
		torches[torch].Drop();
	}

	public void PickUp()
	{
		//Debug.Log ("pickup");
		foreach (Torch torch in torches)
		{
			if(torch.IsDropped() && Vector3.Distance(transform.position, torch.transform.position) <= pickUpRange)
			{
				//Debug.Log("not dropped");
				torch.PickUp(this.transform);
				torch.TurnOff();
			}
		}
	}

    public bool TorchesReady()
    {
		//Debug.Log ("IS IT READY?");
        bool ready = true;
        foreach (Torch torch in torches)
        {
            if(!torch.IsReady())
            {
                ready = false;
            }
        }
        return ready;
    }

    public Torch getRedTorch()
    {
        return torches[0];
    }

    public Torch getBlueTorch()
    {
		return torches[1];
    }

    public Torch getGreenTorch()
    {
		return torches[2];
    }
}

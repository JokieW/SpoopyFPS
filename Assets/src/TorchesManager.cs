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

	public Animator lantern;
	public GameObject redDoor;
	public GameObject redOrb;
	public GameObject blueDoor;
	public GameObject blueOrb;
	public GameObject greenDoor;
	public GameObject greenOrb;

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
					redDoor.SetActive(true);
					activeTorch = -1;
				} else {
					torches [0].TurnOn ();
					activeTorch = 0;
					ResetOrbs();
					lantern.Play ("BLUEtoRED");
					redDoor.SetActive(false);
					blueDoor.SetActive(true);
					greenDoor.SetActive(true);
					torches [1].TurnOff ();
					torches [2].TurnOff ();
				}
			} else if (Input.GetKeyDown (blueKeyCode)) {
				if (torches [1].IsOn ()) {
					torches [1].TurnOff ();
					blueDoor.SetActive(true);
					activeTorch = -1;
				} else {
					torches [1].TurnOn ();
					activeTorch = 1;
					ResetOrbs();
					lantern.Play ("GREENtoBLUE");
					redDoor.SetActive(true);
					blueDoor.SetActive(false);
					greenDoor.SetActive(true);
					torches [0].TurnOff ();
					torches [2].TurnOff ();
				}
			} else if (Input.GetKeyDown (greenKeyCode)) {
				if (torches [2].IsOn ()) {
					torches [2].TurnOff ();
					greenDoor.SetActive(true);
					activeTorch = -1;
				} else {
					torches [2].TurnOn ();
					activeTorch = 2;
					ResetOrbs();
					lantern.Play ("REDtoGREEN");
					redDoor.SetActive(true);
					blueDoor.SetActive(true);
					greenDoor.SetActive(false);
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
		if (activeTorch == 0) {
			redOrb.SetActive (false);
		} else if (activeTorch == 1) {
			blueOrb.SetActive (false);
		} else if (activeTorch == 2) {
			greenOrb.SetActive(false);
		}
	}

	void ResetOrbs()
	{
		redOrb.SetActive(true);
		blueOrb.SetActive(true);
		greenOrb.SetActive(true);
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
				redDoor.SetActive(true);
				blueDoor.SetActive(true);
				greenDoor.SetActive(true);
				torch.TurnOff();
				if (activeTorch == 0) {
					redTorch.TurnOff();
				} else if (activeTorch == 1) {
					blueTorch.TurnOff();
				} else if (activeTorch == 2) {
					greenTorch.TurnOff();
				}
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

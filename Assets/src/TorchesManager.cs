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

	public KeyCode dropKey;
	public KeyCode pickUpKey;

	private int activeTorch = -1;

	public float pickUpRange = 3.0f;

    private List<Torch> torches = new List<Torch>();

    void Start()
    {
        torches.Add(redTorch);
        torches.Add(blueTorch);
        torches.Add(greenTorch);
    }

    void Update()
    {
        if (TorchesReady())
        {
            if (Input.GetKeyDown(redKeyCode))
            {
				if(torches[0].IsOn())
				{
					torches[0].TurnOff();
					activeTorch = -1;
				} else {
					torches[0].TurnOn();
					activeTorch = 0;
					torches[1].TurnOff();
					torches[2].TurnOff();
				}
            }
            else if (Input.GetKeyDown(blueKeyCode))
            {
				if(torches[1].IsOn())
				{
					torches[1].TurnOff();
					activeTorch = -1;
				} else {
					torches[1].TurnOn();
					activeTorch = 1;
					torches[0].TurnOff();
					torches[2].TurnOff();
				}
            }
            else if (Input.GetKeyDown(greenKeyCode))
            {
				if(torches[2].IsOn())
				{
					torches[2].TurnOff();
					activeTorch = -1;
				} else {
					torches[2].TurnOn();
					activeTorch = 2;
					torches[0].TurnOff();
					torches[1].TurnOff();
				}
            }
			else if (Input.GetKeyDown(dropKey))
			{
				if(activeTorch != -1)
				{
					Drop(activeTorch);
				}
			}
			else if (Input.GetKeyDown(pickUpKey))
			{
				PickUp();
			}
        }

    }

	public void Drop(int torch)
	{
		torches[torch].Drop();
	}

	public void PickUp()
	{
		foreach (Torch torch in torches)
		{
			if(torch.IsDropped() && Vector3.Distance(transform.position, torch.transform.position) <= pickUpRange)
			{
				torch.PickUp(this.transform);
				if(activeTorch != -1)
				{
					torch.TurnOff();
				}
			}
		}
	}

    public bool TorchesReady()
    {
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

using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class TorchesManager : MonoBehaviour
{

    private List<Torch> _torches = new List<Torch>();

    public KeyCode redKeyCode;
    public KeyCode blueKeyCode;
    public KeyCode greenKeyCode;
    public KeyCode turnoffCode;

	public KeyCode dropKey;
	public KeyCode pickUpKey;

	private int activeTorch = -1;

	public float pickUpRange = 3.0f;

    private Torch _selected;

	void Awake()
	{
        _selected = null;
	}

    void Update()
    {
        if (TorchesReady())
        {
            if (Input.GetKeyDown(redKeyCode))
            {
                //SetTorch(redTorch);
            }
            else if (Input.GetKeyDown(blueKeyCode))
            {
                //SetTorch(blueTorch);
            }
            else if (Input.GetKeyDown(greenKeyCode))
            {
                //SetTorch(redTorch);
            }
            else if (Input.GetKeyDown(turnoffCode))
            {
                SetTorch(null);
            }
			else if (Input.GetKeyDown(dropKey))
			{
			    Drop();
			}
			else if (Input.GetKeyDown(pickUpKey))
			{
				PickUp();
			}
        }

    }

    public AddTorch(Torch )

    //private Torch GetTorch() { }

    public void SetTorch(Torch torch)
    {
        if (_selected != null)
        {
            _selected.TurnOff();
        }

        _selected = torch;
        if (_selected != null)
        {
            _selected.TurnOn();
        }
    }

	public void Drop()
	{
        //if(tor)
		//torches[torch].Drop();
	}

	public void PickUp()
	{
		/*foreach (Torch torch in torches)
		{
			if(torch.IsDropped() && Vector3.Distance(transform.position, torch.transform.position) <= pickUpRange)
			{
				torch.PickUp(this.transform);
				if(activeTorch != -1)
				{
					torch.TurnOff();
				}
			}
		}*/
	}

    public bool TorchesReady()
    {
        bool ready = true;
        /*foreach (Torch torch in torches)
        {
            if(!torch.IsReady())
            {
                ready = false;
            }
        }*/
        return ready;
    }

    /*public Torch getRedTorch()
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
    }*/
}

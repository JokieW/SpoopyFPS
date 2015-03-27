using UnityEngine;
using System.Collections;

public class Torch : MonoBehaviour {
	
	public Color color = new Color(0, 0, 0);
	public KeyCode keyCode;

	private bool on = false;

	bool shrinking = false;
	bool expanding = false;

	public GameObject model;

	// Use this for initialization
	void Start ()
	{
		gameObject.GetComponent<Renderer>().material.color = color;
	}

    public void Activate()
    {
        if (on)
        {
            shrinking = true;
        }
        else
        {
            expanding = true;
        }
    }

	public void TurnOn()
	{
		if (!on) {
            GetComponent<Light>().enabled = true;
			expanding = true;
		}
	}

	public void TurnOff()
	{
		if (on && !IsDropped()) {
            //GetComponent<Light>().enabled = false;
			shrinking = true;
		}
	}

	void Update ()
	{

		if (shrinking) {
			Shrink();
		} else if (expanding) {
			Expand();
		}
	}

	void Shrink()
	{
		if (transform.localScale.x >= 0) {
			transform.localScale += new Vector3 (-1.0F, -1.0F, -1.0F);
			//GetComponent<Light>().range -= 1;
			GetComponent<Light>().range = transform.localScale.x / 2;
		} else {
			shrinking = false;
			on = false;
		}
	}

	void Expand()
	{
		if (transform.localScale.x < 90) {
			transform.localScale += new Vector3 (+1.0F, +1.0F, +1.0F);
			//GetComponent<Light>().range += 1;
			GetComponent<Light>().range = transform.localScale.x / 2;
		} else {
			expanding = false;
			on = true;
		}
	}

	public bool IsDropped()
	{
		return (transform.parent == null) ? true : false;
	}

	public void Drop()
	{
		transform.parent = null;
		model.SetActive (true);
	}

	public void PickUp(Transform parent)
	{
		transform.parent = parent;
		transform.position = parent.position;
		transform.rotation = parent.rotation;
		model.SetActive (false);
	}

	public bool IsOn()
	{
		return on;
	}

    public bool IsReady()
    {
        return (!expanding && !shrinking) ? (true) : (false);
    }
}

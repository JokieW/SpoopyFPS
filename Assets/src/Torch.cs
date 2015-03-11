﻿using UnityEngine;
using System.Collections;

public class Torch : MonoBehaviour {
	
	public Color color = new Color(0, 0, 0);
	public KeyCode keyCode;

	private bool on = false;

	bool shrinking = false;
	bool expanding = false;

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
			expanding = true;
		}
	}

	public void TurnOff()
	{
		if (on && !IsDropped()) {
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
			GetComponent<Light>().range -= 1;
		} else {
			shrinking = false;
			on = false;
		}
	}

	void Expand()
	{
		if (transform.localScale.x < 30) {
			transform.localScale += new Vector3 (+1.0F, +1.0F, +1.0F);
			GetComponent<Light>().range += 1;
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
	}

	public void PickUp(Transform parent)
	{
		transform.parent = parent;
		transform.position = parent.position;
		transform.rotation = parent.rotation;
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

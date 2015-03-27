using UnityEngine;
using System.Collections;

public class Bouncing : MonoBehaviour {

	float start = 0.0f;
	float end = 1.0f;
	float current = 0.0f;
	float increment = 0.01f;
	bool rising = true;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		if (rising) {
			transform.position = new Vector3 (transform.position.x, transform.position.y + increment, transform.position.z);
			current += increment;
			if (current >= end) {
				rising = false;
			}
		} else {
			transform.position = new Vector3 (transform.position.x, transform.position.y - increment, transform.position.z);
			current -= increment;
			if (current <= start) {
				rising = true;
			}
		}
	}
}

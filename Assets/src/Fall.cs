using UnityEngine;
using System.Collections;

public class Fall : MonoBehaviour {

	public Transform center;

	void OnTriggerEnter(Collider collider) {
		if (collider.gameObject.tag == "Player") {
			collider.transform.position = center.position;
			collider.transform.rotation = center.rotation;
		}
	}
}

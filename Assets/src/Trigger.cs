using UnityEngine;
using System.Collections;

public class Trigger : MonoBehaviour {

	public BlockMover block;

	void OnTriggerEnter(Collider collider) {
		if (collider.gameObject.tag == "Player") {
			block.enabled = true;
		}
	}
}

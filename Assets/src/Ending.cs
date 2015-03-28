using UnityEngine;
using System.Collections;

public class Ending : MonoBehaviour {

	public GameObject player;
	public Transform sky;
	bool ascend = false;

	void Update()
	{
		if (ascend) {
			player.transform.position = Vector3.MoveTowards(player.transform.position, sky.position, 2 * Time.deltaTime);
		}
	}

	void OnTriggerEnter(Collider collider) {

		if (collider.gameObject.tag == "Player") {
			ascend = true;
			player.GetComponent<CharacterController>().enabled = false;
		}
	}
}

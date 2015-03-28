using UnityEngine;
using System.Collections;

public class TorchAnimation : MonoBehaviour {

	public Torch redTorch;
	public Torch blueTorch;
	public Torch greenTorch;

	public Transform redDestination;
	public Transform blueDestination;
	public Transform greenDestination;

	float speed = 12.0f;

	float time = 30;


	private bool animateThatThingy = false;

	// Use this for initialization
	void Start () {
		redTorch.TurnOn ();
		redTorch.Drop ();
		blueTorch.TurnOn ();
		blueTorch.Drop ();
		greenTorch.TurnOn ();
		greenTorch.Drop ();
	}

	void Update() {
		if (animateThatThingy) {
			time -= Time.deltaTime;
			if(time < 0)
			{
				Destroy(this);
			}
			redTorch.transform.position = Vector3.MoveTowards(redTorch.transform.position, redDestination.position, speed*Time.deltaTime);
			blueTorch.transform.position = Vector3.MoveTowards(blueTorch.transform.position, blueDestination.position, speed*Time.deltaTime);
			greenTorch.transform.position = Vector3.MoveTowards(greenTorch.transform.position, greenDestination.position, speed*Time.deltaTime);
		}
	}

	void OnTriggerEnter(Collider collider) {
		if (collider.gameObject.tag == "Player") {
			animateThatThingy = true;
		}
	}
}

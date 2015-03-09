using UnityEngine;
using System.Collections;

public class ProximityCS : MonoBehaviour {

	public GameObject torch;

	// Update is called once per frame
	void Update () {
		if (torch != null) {
			// Pass the player location to the shader
			GetComponent<Renderer>().sharedMaterial.SetVector("_PlayerPosition", torch.transform.position);
            GetComponent<Renderer>().sharedMaterial.SetFloat("_VisibleDistance", (torch.transform.localScale.x / 2));
		}
	}
}

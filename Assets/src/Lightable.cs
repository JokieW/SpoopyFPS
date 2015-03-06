using UnityEngine;
using System.Collections;

public class Lightable : MonoBehaviour {

	public bool red = false;
	public bool blue = false;
	public bool green = false;

	public Material litRed;
	public Material unlitRed;

	public Material litBlue;
	public Material unlitBlue;

	public Material litGreen;
	public Material unlitGreen;

	// Use this for initialization
	void Start () {
		/*if(red){
			gameObject.GetComponent<Renderer>().material = unlitRed;
		} else if (blue) {
			gameObject.GetComponent<Renderer>().material = unlitBlue;
		} else {
			gameObject.GetComponent<Renderer>().material = unlitGreen;
		}*/
	}

	void OnTriggerEnter(Collider collider) {
		//Debug.Log ("collision");
		if (collider.gameObject.tag == "Torch")
		{
			Torch torch = collider.gameObject.GetComponent("Torch") as Torch;
			if(torch.color == Color.red && red)
			{
				Illuminate(true);
			}
			if(torch.color == Color.blue && blue)
			{
				Illuminate(true);
			}
			if(torch.color == Color.green && green)
			{
				Illuminate(true);
			}
		}
	}

	void OnTriggerExit(Collider collider)
	{
		if (collider.gameObject.tag == "Torch")
		{
			Illuminate(false);
		}
	}

	void Illuminate(bool light)
	{
		if (light) {
			/*if(red){
				gameObject.GetComponent<Renderer>().material = litRed;
			} else if (blue) {
				gameObject.GetComponent<Renderer>().material = litBlue;
			} else {
				gameObject.GetComponent<Renderer>().material = litGreen;
			}*/

			GetComponent<Collider>().isTrigger = false;
		} else {
			/*if(red){
				gameObject.GetComponent<Renderer>().material = unlitRed;
			} else if (blue) {
				gameObject.GetComponent<Renderer>().material = unlitBlue;
			} else {
				gameObject.GetComponent<Renderer>().material = unlitGreen;
			}*/
			GetComponent<Collider>().isTrigger = true;
		}
	}
}

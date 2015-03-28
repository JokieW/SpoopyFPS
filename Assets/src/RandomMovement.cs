using UnityEngine;
using System.Collections;

public class RandomMovement : MonoBehaviour {

	float minX = -0.2f;
	float maxX = 0.1f;
	float minY = -0.1f;
	float maxY = 0.1f;
	float speed = 0.005f;

	float randomX = 0.0f;
	float randomY = 0.0f;

	Vector3 randomVector = Vector3.zero;

	float timer = 3;

	void Start ()
	{
		randomVector = new Vector3(Random.Range(minX, maxX), Random.Range(minY, maxY), transform.position.z);
	}

	// Update is called once per frame
	void Update () {
		if(timer >= 0)
		{
			transform.position = Vector3.MoveTowards(transform.position, randomVector, speed * Time.deltaTime);
			timer -= Time.deltaTime;
		} else {
			timer = 3.0f;
			randomVector = new Vector3(transform.position.x + Random.Range(minX, maxX), transform.position.y + Random.Range(minY, maxY), transform.position.z);
		}
	}
}

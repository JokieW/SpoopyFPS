using UnityEngine;
using System.Collections;

public class CharacterLight : MonoBehaviour 
{
    public MeshRenderer render, render1, render2;
	void Start () 
    {
	
	}
	
	void Update () 
    {
        float speed = 10.0f;
        if (Input.GetKey(KeyCode.W))
        {
            transform.Translate(Vector3.forward * speed * Time.deltaTime);
        }
        if (Input.GetKey(KeyCode.S))
        {
            transform.Translate(Vector3.back * speed * Time.deltaTime);
        }
        if (Input.GetKey(KeyCode.A))
        {
            transform.Translate(Vector3.left * speed * Time.deltaTime);
        }
        if (Input.GetKey(KeyCode.D))
        {
            transform.Translate(Vector3.right * speed * Time.deltaTime);
        }
        render.sharedMaterial.SetVector("_PlayerPosition", transform.position);
        render1.sharedMaterial.SetVector("_PlayerPosition", transform.position);
        render2.sharedMaterial.SetVector("_PlayerPosition", transform.position);
	}
}

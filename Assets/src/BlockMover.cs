using UnityEngine;
using System.Collections;

public class BlockMover : MonoBehaviour 
{
    public Vector3 pointA;
    public Vector3 pointB;
    public float cycleTime;
    public AnimationCurve curve;

    private float _startTime;

	// Use this for initialization
	void Start () 
    {
        _startTime = Time.time;
	}
	
	// Update is called once per frame
	void Update () 
    {
        float t = (Time.time - _startTime)%cycleTime;
        transform.position = Vector3.Lerp(pointA, pointB, curve.Evaluate(t / cycleTime));
	}
}

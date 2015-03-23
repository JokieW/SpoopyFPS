using UnityEngine;

[RequireComponent(typeof(Light))]
public class TorcheRandomizer : MonoBehaviour
{
    public float minIntensity = 0.25f; public float maxIntensity = 0.5f;

    float random;
    Light _light;

    void Awake()
    {
        random = Random.Range(0.0f, 65535.0f);
        _light = GetComponent<Light>();
    }

    void Update()
    {
        float noise = Mathf.PerlinNoise(random, Time.time);
        _light.intensity = Mathf.Lerp(minIntensity, maxIntensity, noise);
        _light.range = Mathf.Lerp(minIntensity+20, maxIntensity+20, noise);
    }

}
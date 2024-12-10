using UnityEngine;

public class ParticlePool : MonoBehaviour
{
    [SerializeField]
    float lifeTime;
    float endTime;
    ParticleSystem particle;
    int _index;
    bool isPlay;
    public void Play(int index,Vector3 pos)
    {
        transform.position = pos;
        gameObject.SetActive(true);
        particle = GetComponent<ParticleSystem>();
        particle.Play();
        endTime=+lifeTime+Time.time;
        _index = index;
isPlay=true;
    }
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if ( Time.time > endTime &&isPlay)
        {
            isPlay = false;
            Manager<ObjectPoolManager>.Inst.BackGoToPool(_index,gameObject);
            gameObject.SetActive(false);
        }

        
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
namespace FSM
{
    public class GoContainer : CoreComponent
    {
        public List<GameObject> goList=new();
        public AudioClip[] acs;

        AudioSource AS;
 
        protected override void Awake()
        {
            base.Awake();
            AS=GetComponent<AudioSource>();
        }
        public void SetGoActive(int index,bool isActive)
        {
            if(goList.Count>index&&index>=0)
                goList[index].SetActive(isActive);
        }
        public void PlayAudioClip(int index)
        {
            if(acs.Length>index&&index>=0)
                AS.PlayOneShot(acs[index]);
        }
        public void RestartParticle(int index)
        {
            if(index>=0&&goList.Count>index)
            if(goList[index].TryGetComponent<ParticleSystem>(out var particle))
            {
                particle.Stop();
                goList[index].SetActive(true);
                particle.Play();
            }

        }
        private void Start()
        {
            
        }
        public override void LogicUpdate()
        {
            base.LogicUpdate();
        }

        public override void PhysicsUpdate()
        {
            base.PhysicsUpdate();
        }
    }
}

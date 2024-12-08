using System;
using System.Collections.Generic;
using UnityEngine;

public struct SBulletState
{
    public Vector3 pos;
    public bool isActive;
}

namespace FSM
{
    public class Bullet : MonoBehaviour,ITimeBackable
    {
        float velocity = 10f;
        bool _isShoot=false;
        float lifeTime;
        Vector3 _dir;

        #region TimeBack
        bool _isBack;
        TimeBackManager _backManager;
        Dictionary<int, SBulletState> _timeRecords = new(100);

        private void OnEnable()
        {
            _backManager = DataModule.Resolve<GamePlayDM>().TimeBackManager;
            _backManager.Register(this);
        }
        private void OnDisable()
        {
            _backManager.UnRegister(this);
        }
        public void TimeStateRecord(int index)
        {
            if ( _timeRecords.ContainsKey(index) )
                _timeRecords[index] = new SBulletState()
                {
                    pos = transform.position,
                    isActive = gameObject.activeSelf,
                };
            else
                _timeRecords.Add(index, new SBulletState()
                {
                    pos = transform.position,
                    isActive = gameObject.activeSelf,
                });
        }
        public void TimeBackStart(int index)
        {
            _isBack = true;
        }
        public void TimeBackTick(int index)
        {
            if ( _timeRecords.ContainsKey(index) )
            {
                transform.position = _timeRecords[index].pos;
                gameObject.SetActive(_timeRecords[index].isActive);
                _timeRecords.Remove(index);
            }
        }
        public void TimeBackEnd(int index)
        {
            _isBack = false;
        }

        #endregion
        public void Shoot(Vector3 dir)
        {
            _isShoot = true;
            _dir = dir;
            lifeTime = _backManager.GameTime;
        }

        private void Update()
        {
            if (_isShoot)
            {
                transform.position += _dir * velocity;
                if(lifeTime+3f<_backManager.GameTime)
                    Destroy(gameObject);
            }
        }
    }
}
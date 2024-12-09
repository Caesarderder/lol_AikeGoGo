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
    public class Bullet : MonoBehaviour
    {
        float _velocity = 10f;
        float _damage;
        AttackUid _attackUid;
        bool _isShoot=false;
        float lifeTime;
        Vector3 _dir;
        Rigidbody rb;

        PlayerMovement playerMovement;
        private void Awake()
        {
            _attackUid = new AttackUid();
            rb = GetComponent<Rigidbody>();
            playerMovement=DataModule.Resolve<GamePlayDM>().GetPlayer().Movement;
        }

        #region TimeBack
        bool _isBack;
        //TimeBackManager _backManager;
        //Dictionary<int, SBulletState> _timeRecords = new(100);

        //private void OnEnable()
        //{
        //    _backManager = DataModule.Resolve<GamePlayDM>().TimeBackManager;
        //    _backManager.Register(this);
        //}
        //private void OnDisable()
        //{
        //    _backManager.UnRegister(this);
        //}
        //public void TimeStateRecord(int index)
        //{
        //    if ( _timeRecords.ContainsKey(index) )
        //        _timeRecords[index] = new SBulletState()
        //        {
        //            pos = transform.position,
        //            isActive = gameObject.activeSelf,
        //        };
        //    else
        //        _timeRecords.Add(index, new SBulletState()
        //        {
        //            pos = transform.position,
        //            isActive = gameObject.activeSelf,
        //        });
        //}
        //public void TimeBackStart(int index)
        //{
        //    _isBack = true;
        //}
        //public void TimeBackTick(int index)
        //{
        //    if ( _timeRecords.ContainsKey(index) )
        //    {
        //        transform.position = _timeRecords[index].pos;
        //        gameObject.SetActive(_timeRecords[index].isActive);
        //        _timeRecords.Remove(index);
        //    }
        //}
        //public void TimeBackEnd(int index)
        //{
        //    _isBack = false;
        //}

        #endregion
        public void Fire(Vector3 dir,float damage,float velocity)
        {
            _damage= damage;
            _velocity = velocity;
            _attackUid.Reset();
            _isShoot = true;
            _dir = dir;
            //lifeTime = _backManager.GameTime;
        }

        private void Update()
        {
            if (_isShoot&&!_isBack)
            {
                rb.linearVelocity = _dir * (_velocity+playerMovement.MapMoveSpeed);
                if(lifeTime+3f>Time.time)
                    Destroy(gameObject);
            }
        }

        private void OnTriggerEnter(Collider other)
        {
            var player =other.GetComponentInParent<PlayerEntity>();
            if(player!=null)
            {
                player.Combat.ReceiveDamage(_attackUid.value,_damage);
                gameObject.SetActive(false);
            }
        }
    }
}
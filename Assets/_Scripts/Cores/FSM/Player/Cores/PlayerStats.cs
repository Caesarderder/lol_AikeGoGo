using UnityEngine;
using UnityEngine.Events;

namespace FSM
{
    public class PlayerStats:Stats
    {
        public float curSp;
        float MaxSp;
        PlayerEntity player=>(PlayerEntity)Entity;
        float _spRecoverSpeed;
        protected override void Awake()
        {
            base.Awake();
            curSp = MaxSp = player.Data.MaxSp;
            _spRecoverSpeed = player.Data.SpRecoverSPeed;
        }
        protected void Start()
        {
            EventAggregator.Publish(new SPlayerChangeHealth
            {
                cur=CurHP,
                max=MaxHP
            });
            EventAggregator.Publish(new SPlayerChangeSp
            {
                cur=curSp,
                max=MaxSp
            });
        }
        private void Update()
        {
            SpChange(_spRecoverSpeed * Time.unscaledDeltaTime);
            
        }
        public bool CheckIfCanSpell(float spCost)
        {
            return curSp>=spCost;

        }
        public override void HealthChange(float value)
        {
            var old=CurHP;
            base.HealthChange(value);
            EventAggregator.Publish(new SPlayerChangeHealth
            {
                old = old,
                cur=CurHP,
                max=MaxHP
            });

        }    

        public void SpChange(float value)
        {
            var old=curSp;
            curSp += Mathf.Clamp(0f,MaxSp,value) ;
            if ( old == curSp)
                return;
            EventAggregator.Publish(new SPlayerChangeSp
            {
                old = old,
                cur=curSp,
                max=MaxSp
            });
        }
    }
}
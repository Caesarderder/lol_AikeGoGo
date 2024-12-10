using UnityEngine;
using UnityEngine.Events;
using static UnityEngine.Rendering.DebugUI;

namespace FSM
{
    public class PlayerStats:Stats
    {
        public float curSp;
        float MaxSp;
        PlayerEntity player=>(PlayerEntity)Entity;
        GoContainer gos;
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
            gos = player.GoContainer;  
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
            if(!player.isDie&&CurHP+value<=0&&CheckIfCanSpell(player.Data.TimeBackSpCost)&&!player.PlayerTimeFrozen.IsFrozen)
            {
                SpChange(-player.Data.TimeBackSpCost);
                DataModule.Resolve<GamePlayDM>().TimeBackManager.DoTimeBack(player.GetBackIndex());
                return;
            }
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
            curSp = Mathf.Clamp(curSp + value,0f, MaxSp) ;
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
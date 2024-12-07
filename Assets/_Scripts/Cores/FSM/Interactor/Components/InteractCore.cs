using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

namespace FSM
{
    public class InteractCore: CoreComponent 
    {
        private Stats Stats;

        public List<InteractAction> actions;

        protected override void Awake()
        {
            base.Awake();
            actions=GetComponentsInChildren<InteractAction>().ToList();
            foreach ( var action1 in actions ) {
                action1.Init((InteractorEntity)Entity);
            }
        }

        protected void Start()
        {
            Stats = core.GetCoreComponent<Stats>();
        }

        public int GetRandomActions()
        {
            return UnityEngine.Random.Range(0, actions.Count);
        }

        public bool CheckIfDoAction(int index)
        {
            return actions[index].CheckIfDoAction();
        }

        public void DoAction(int index)
        {
            actions[index].DoAction();
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
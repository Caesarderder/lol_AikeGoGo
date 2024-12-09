using System;
using System.Collections.Generic;
using UnityEngine;

namespace FSM
{
    public class SevikaBoxingAttackAction : InteractMeleeAttackAction
    {
        [SerializeField]
        GameObject boxing;

        protected override void Start()
        {
            base.Start();
            boxing.SetActive(false);
        }

        public override void DoAction()
        {
            base.DoAction();
            boxing.SetActive(true);
        }


         public override void OnAction(int index)
        {
            base.OnAction(index);
            EndAction();
        }
        public override void EndAction()
        {
            base.EndAction();
            boxing.SetActive(false);
        }
    }
}
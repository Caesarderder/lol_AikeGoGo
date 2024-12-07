using System;
using System.Collections.Generic;
using UnityEngine;

public class AnimationTrigger: MonoBehaviour
{
    public Action action;
    public void OnAnimationTrigger()
    {
        action?.Invoke();
    }
}

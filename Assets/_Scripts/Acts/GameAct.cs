using UnityEngine;
using System.Threading.Tasks;
using System.Collections.Generic;
public class GameAct: ActBase
{
    public override async Task OnLoad()
    {
        base.OnLoad();
        var uiManager = Manager<UIManager>.Inst;

        //����HomePanel
        var panel = await uiManager.ShowUI<GamePlayPanel>();
    }

    public override void OnLoaded()
    {
        base.OnLoaded();
    }

    public override void OnUnload()
    {
        base.OnUnload();
        Manager<UIManager>.Inst.DestroyUI<GamePlayPanel>(); 
    }

    public override void OnUnloaded()
    {
        base.OnUnloaded();

    }
}

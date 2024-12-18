using System;
using System.Threading.Tasks;
using TMPro;
using UniRx;
using UniRx.Triggers;
using UnityEngine;
using UnityEngine.UI;

public class LevelWordPanel : ViewBase
{
    [SerializeField]
    TMP_InputField if_num;
    [SerializeField]
    Button 
        btn_monobehavior,
        btn_burstAndJobs,
        btn_Ecs
        ;

    //UI打开时参数传递
    public void Init(int num)
    {
        if_num.text = num.ToString();
    }
    

#region Unity

    private void Start()
    {
    }

    private void Update()
    {
    }
    public override void Show()
    {
        base.Show();

        if_num.onEndEdit.AddListener((x =>
        {
            DataModule.Resolve<TestDataModule>().OnTestDataChange(int.Parse(x));
        }));
    }

    public override void Destroy()
    {
        base.Destroy();
    }

    public override void Hide()
    {
        base.Hide();
        if_num.onEndEdit.RemoveAllListeners();
    }

    public override void Load()
    {
        base.Load();
    }

    #endregion

    
    


}

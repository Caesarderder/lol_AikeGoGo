using System.Collections.Generic;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Init : MonoBehaviour
{

    [SerializeField]
    List<GameObject> _initGos;
    [SerializeField]
    GameObject ui;

    public bool QuickStart=false;

    #region Methods
    public async void Awake()
    {
        foreach ( GameObject go in _initGos ) {
            Destroy(go);
        }
        //await SceneManager.UnloadSceneAsync(SceneManager.GetSceneAt(1));
        await ContainerInit();
        _initGos.Add(gameObject);
        //if( !QuickStart ) 
        LoadMainAct();
    }

    private async Task ContainerInit()
    {
        #region Register      
        var tableManager = new TableManager();
        await tableManager.Init();
        GContext.RegisterSingleton<TableManager>(tableManager);

        var resManager= new ResManager();
        await resManager.Init();
        GContext.RegisterSingleton<MonoManager>(ResManager.MonoManager);
        GContext.RegisterSingleton<ResManager>(resManager);

        Debug.Log("Table Init time:"+Time.time);

        var uiManager=new UIManager();
        await uiManager.Init(ResManager.MonoManager.UIRoot);
        GContext.RegisterSingleton<UIManager>(uiManager);

        var audioManager=new AudioManager();
        audioManager.Init();
        GContext.RegisterSingleton<AudioManager>(audioManager);



        GContext.RegisterSingleton<ActManager>();
        GContext.RegisterSingleton<InputManager>();

        GContext.RegisterSingleton<ObjectPoolManager>();
        GContext.RegisterMoudle<InputDataModule>();
        GContext.RegisterMoudle<GameStatusDM>();
        GContext.RegisterMoudle<GamePlayDM>();

        Debug.Log("GContext register time:"+Time.time);

        Manager<ObjectPoolManager>.Inst.InitGoPools(ResManager.MonoManager.gameParticles);
        #endregion
    }

    private async void LoadMainAct()
    {
        await Manager<ActManager>.Inst.LoadAct<HomeAct>();
        Destroy(ui);
        //_=Manager<UIManager>.Inst.ShowUI<HomePanelHomePanel>();
    }

    #endregion
}

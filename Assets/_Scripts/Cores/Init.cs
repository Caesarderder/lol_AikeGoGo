using System.Collections.Generic;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Init : MonoBehaviour
{

    [SerializeField]
    List<GameObject> _initGos;

    public bool QuickStart=false;

    #region Methods
    public async void Awake()
    {
        await SceneManager.UnloadSceneAsync(SceneManager.GetSceneAt(1));
        await ContainerInit();
        _initGos.Add(gameObject);
        foreach ( GameObject go in _initGos ) {
            Destroy(go);
        }
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

        GContext.RegisterMoudle<InputDataModule>();
        GContext.RegisterMoudle<GameStatusDM>();
        GContext.RegisterMoudle<GamePlayDM>();

        Debug.Log("GContext register time:"+Time.time);
        Manager<AudioManager>.Inst.PlaySoundEffect(EAudioEffectIndex.test1);

        #endregion
    }

    private void LoadMainAct()
    {
        _=Manager<ActManager>.Inst.LoadAct<GameAct>();
        _=Manager<UIManager>.Inst.ShowUI<GamePlayPanel>();
    }

    #endregion
}

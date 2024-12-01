using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UnityEditor.Embree;
using UnityEngine;
using UnityEngine.AddressableAssets;
using UnityEngine.ResourceManagement.AsyncOperations;

public class ResManager
{
    #region Fields ��� Ů��
    public static readonly string BigPlanet="BigPlanet";
    public static readonly string KWPlayer="KWPlayer";
    public static readonly string CWPlayer="CWPlayer";

    public static MonoManager MonoManager;


    private Dictionary<string, AsyncOperationHandle<GameObject>> dic_loadingOps = new Dictionary<string, AsyncOperationHandle<GameObject>>();
    #endregion

    #region Methods
    public async Task Init()
    {
        MonoManager=await LoadGo<MonoManager>("MonoManager");
        GameObject.DontDestroyOnLoad(MonoManager.gameObject);
    }
    public async Task<T> LoadGo<T>(string address,Transform parent,Vector3 pos) where T : MonoBehaviour
    {
        AsyncOperationHandle<GameObject> handle;
        // ��ֹ�ظ�����
        if ( !dic_loadingOps.ContainsKey(address) )
        {
            // ʹ��Addressables�첽����GameObject
            handle = Addressables.LoadAssetAsync<GameObject>(address);
            dic_loadingOps.Add(address, handle);
        }
        else
            handle = dic_loadingOps[address];

        var go = await handle.Task;


        if ( handle.Status == AsyncOperationStatus.Succeeded )
        {
            // ʵ����GameObject
            GameObject loadedGameObject = GameObject.Instantiate(go,pos,go.transform.rotation,parent);
            var mono= loadedGameObject.GetComponent<T>();

            if ( mono != null )
            {
                return mono;
            }
        }
        else
        {
            Debug.LogError($"Failed to load  go {address} via Addressables.");
            dic_loadingOps.Remove(address);
        }

        //Debug.LogError($"none go adds to load {address}.");
        return default;
    }
    public async Task<T> LoadGo<T>(string address,Transform parent) where T : MonoBehaviour
    {
        AsyncOperationHandle<GameObject> handle;
        // ��ֹ�ظ�����
        if ( !dic_loadingOps.ContainsKey(address) )
        {
            // ʹ��Addressables�첽����GameObject
            handle = Addressables.LoadAssetAsync<GameObject>(address);
            dic_loadingOps.Add(address, handle);
        }
        else
            handle = dic_loadingOps[address];

        var go = await handle.Task;


        if ( handle.Status == AsyncOperationStatus.Succeeded )
        {
            // ʵ����GameObject
            GameObject loadedGameObject = GameObject.Instantiate(go,parent);
            var mono= loadedGameObject.GetComponent<T>();

            if ( mono != null )
            {
                return mono;
            }
        }
        else
        {
            Debug.LogError($"Failed to load  go {address} via Addressables.");
            dic_loadingOps.Remove(address);
        }

        //Debug.LogError($"none go adds to load {address}.");
        return default;
    }
    /// <summary>
    /// ʹ��Addressable����GameObject
    /// </summary>
    public async Task<T> LoadGo<T>(string address) where T : MonoBehaviour
    {
        AsyncOperationHandle<GameObject> handle;
        // ��ֹ�ظ�����
        if ( !dic_loadingOps.ContainsKey(address) )
        {
            // ʹ��Addressables�첽����GameObject
            handle = Addressables.LoadAssetAsync<GameObject>(address);
            dic_loadingOps.Add(address, handle);
        }
        else
            handle = dic_loadingOps[address];

        var go = await handle.Task;


        if ( handle.Status == AsyncOperationStatus.Succeeded )
        {
            // ʵ����GameObject
            GameObject loadedGameObject = GameObject.Instantiate(go);
            var mono= loadedGameObject.GetComponent<T>();

            if ( mono != null )
            {
                return mono;
            }
        }
        else
        {
            Debug.LogError($"Failed to load  go {address} via Addressables.");
            dic_loadingOps.Remove(address);
        }

        //Debug.LogError($"none go adds to load {address}.");
        return default;
    }

    /// <summary>
    /// ɾ��GameObject���ͷ�ָ����GameObject��Դ
    /// </summary>
    public void DestoryGo(GameObject go,string address)
    {
        if ( go != null )
        {
            UnityEngine.GameObject.Destroy(go);
        }
        ReleaseHandle(address);
    }

    /// <summary>
    /// �ͷ�ָ����GameObject��Դ
    /// </summary>
    public void ReleaseHandle(string address)
    {
        if ( dic_loadingOps.ContainsKey(address) )
        {
            // ж��Addressables��Դ
            Addressables.Release(dic_loadingOps[address]);
            dic_loadingOps.Remove(address);
        }
    }

    #endregion
}


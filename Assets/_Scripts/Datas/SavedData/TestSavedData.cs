using System.Collections.Generic;

public class GameStatusSavedData:LocalSaveData
{
    public int UnlockLevelCount; 
    public int CurSelectedLevel;

    //�����Ƿ����
    public Dictionary<int,bool> RunesRecord=new();
    public Dictionary<int,string> RunesDescRecord=new();

    public Dictionary<int, string> RunesRecordDesc = new();


}

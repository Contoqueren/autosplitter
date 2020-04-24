state("Color Symphony")
{
    string8 level : 0x0033C34, 0x0;
    uint begin : 0x0052974, 0x0;
}

init
{
    vars.levelNumberMax = 1;
    vars.split = 0;
}

update
{

}

startup
{
    
}

start
{
    if (current.begin == 2 && old.begin == 1)
    {
        vars.levelNumberMax = 1;
        vars.split = 0;
        return true;
    }
}

split
{
    try
    {
        if (current.begin == 4 && old.begin == 3)
            {
                return true;
            } 
        
        if (current.level != "stageEnd")
        {
            string levelNumberSub = current.level.Substring(5,3);
            int levelNumber = Convert.ToInt32(levelNumberSub);
            string levelNumberSubOld = old.level.Substring(5,3);
            int levelNumberOld = Convert.ToInt32(levelNumberSubOld);

            
            if (levelNumber > levelNumberOld && vars.levelNumberMax < levelNumber)
            {
                vars.split = vars.split + 1 ;
                return true;
            }
    
            if(vars.split > 0 && vars.levelNumberMax < levelNumber)
            {
                vars.levelNumberMax = levelNumber;
            }

        }
        else 
        {
            if (old.level == "stage050" && vars.split == 49)
            {
                vars.split = vars.split + 1 ;
                return true;
            }
        }

        

    }
    
    catch(Exception e)
    {
        return false;
    }

}

reset
{
    if (current.begin == 1 && old.begin > 2)
    {
        vars.levelNumberMax = 1;
        vars.split = 0;
        return true;
    }
}
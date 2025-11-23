local blockFistSkill = EventCallback("blockFistSkill")  
  
function blockFistSkill.playerOnGainSkillTries(player, skill, tries)  
    if skill == SKILL_FIST then  
        return 0  
    end  
      
    return tries  
end  
  
blockFistSkill:register()
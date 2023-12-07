function groups = combineSmallGroups(groups, faces, normals, minGroupSize)
    uniqueGroups = unique(groups); % Trouver les groupes uniques
    %disp(['Nombre de groupes avant la combinaison : ', num2str(length(uniqueGroups))]);

    for i = 1:length(uniqueGroups) % Parcourir chaque groupe unique
        currentGroup = uniqueGroups(i);
        groupIndices = find(groups == currentGroup); % Indices des triangles dans le groupe courant
        %disp(['Groupe ', num2str(currentGroup), ' - Nombre de triangles avant combinaison : ', num2str(length(groupIndices))]);

        if length(groupIndices) < minGroupSize % Vérifier la taille du groupe
            adjacentGroup = findAdjacentGroup(groupIndices, faces, groups, normals); % Trouver un groupe adjacent
            if ~isempty(adjacentGroup)
                groups(groupIndices) = adjacentGroup; % Assigner les triangles au groupe adjacent                
            end
        end
    end
    % uncomment pour regarder la combinaison des triangles
    %     for i = 1:length(uniqueGroups)
    %     currentGroup = uniqueGroups(i);
    %     newGroupIndices = find(groups == currentGroup);
    %     disp(['Groupe ', num2str(currentGroup), ' - Nombre de triangles après combinaison : ', num2str(length(newGroupIndices))]);
    % end
    % 
    % uniqueGroupsAfter = unique(groups);
    % disp(['Nombre de groupes après la combinaison : ', num2str(length(uniqueGroupsAfter))]);
end



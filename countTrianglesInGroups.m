function groupCounts = countTrianglesInGroups(groups)
    uniqueGroups = unique(groups); % Identifier les groupes uniques
    numGroups = length(uniqueGroups); % Nombre de groupes uniques
    groupCounts = zeros(numGroups, 1); % Initialiser le compteur pour chaque groupe

    for i = 1:numGroups
        groupCounts(i) = sum(groups == uniqueGroups(i)); % Compter le nombre de triangles dans chaque groupe
    end

    % Afficher le nombre de triangles dans chaque groupe
    for i = 1:numGroups
        disp(['Groupe ID ', num2str(uniqueGroups(i)), ' contient ', num2str(groupCounts(i)), ' triangles.']);
    end
end

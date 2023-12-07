function visualizeSegmentedMesh2(vertices, faces, groups)
    figure; 
    hold on; 
    axis equal; 
    view(3); % 
    title('Maillage après segmentation avec couleurs aléatoires'); 

    % Générer une couleur aléatoire pour chaque groupe unique
    uniqueGroups = unique(groups);
    colors = rand(length(uniqueGroups), 3); % Couleurs RGB aléatoires

    % Dessiner chaque groupe avec une couleur différente
    for i = 1:length(uniqueGroups)
        groupIndex = uniqueGroups(i);
        groupFaces = faces(groups == groupIndex, :); % Extraire les faces du groupe
        patch('Vertices', vertices, 'Faces', groupFaces, 'FaceColor', colors(i, :), 'EdgeColor', 'none'); % Dessiner le groupe
    end

    hold off; 
end

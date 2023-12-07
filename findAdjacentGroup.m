function adjacentGroup = findAdjacentGroup(groupIndices, faces, groups, normals)
    adjacentGroup = []; % Initialiser le groupe adjacent
    minimumAngle = inf; % Initialiser l'angle minimum

    for i = 1:length(groupIndices) % Parcourir les triangles dans le groupe actuel
        triangleIndex = groupIndices(i);
        adjacentTriangles = findAdjacentTriangles(triangleIndex, faces); % Trouver les triangles adjacents

        for j = 1:length(adjacentTriangles) % Parcourir les triangles adjacents
            adjTriangleIndex = adjacentTriangles(j);

            if groups(adjTriangleIndex) ~= groups(triangleIndex) % Vérifier si le triangle appartient à un autre groupe
                angle = acos(dot(normals(triangleIndex, :), normals(adjTriangleIndex, :))); % Calculer l'angle entre les normales

                if angle < minimumAngle % Mettre à jour le groupe adjacent si l'angle est plus petit
                    minimumAngle = angle;
                    adjacentGroup = groups(adjTriangleIndex);
                end
            end
        end
    end
end

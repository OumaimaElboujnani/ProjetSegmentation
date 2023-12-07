function groups = selectTriangleGroups(vertices, faces, normals, angleThresholdRad)
    numTriangles = size(faces, 1); % Nombre de triangles
    groups = zeros(numTriangles, 1); % Initialiser les groupes
    groupIndex = 0; % Index pour le groupe courant

    visited = false(numTriangles, 1); % Marquer les triangles visités

    for i = 1:numTriangles
        if ~visited(i)
            groupIndex = groupIndex + 1;
            groups(i) = groupIndex;
            visited(i) = true;

            stack = i;
            while ~isempty(stack)
                current = stack(end);
                stack(end) = []; % Retirer le dernier élément

                adjacentTriangles = findAdjacentTriangles(current, faces);

                for j = 1:length(adjacentTriangles)
                    adjTriangle = adjacentTriangles(j);
                    if ~visited(adjTriangle)
                        % Calcul de la déviation des vecteurs normaux
                        dx = normals(current, 1) - normals(adjTriangle, 1);
                        dy = normals(current, 2) - normals(adjTriangle, 2);
                        dz = normals(current, 3) - normals(adjTriangle, 3);
                        angle = sqrt(dx^2 + dy^2 + dz^2); % Calcul de l'angle pour le comparer avec angleThresholdRad

                        if angle <= angleThresholdRad
                            groups(adjTriangle) = groupIndex;
                            visited(adjTriangle) = true;
                            stack(end + 1) = adjTriangle;
                        end
                    end
                end
            end
        end
    end
end
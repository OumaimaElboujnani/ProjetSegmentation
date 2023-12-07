function adjacentTriangles = findAdjacentTriangles(triangleIndex, faces)
    adjacentTriangles = []; % Initialiser la liste des triangles adjacents
    currentFace = faces(triangleIndex, :); % Le triangle actuel

    for i = 1:size(faces, 1) % Parcourir tous les autres triangles
        if i ~= triangleIndex % S'assurer de ne pas comparer le triangle avec lui-même
            sharedVertices = intersect(currentFace, faces(i, :)); % Trouver les sommets partagés
            if length(sharedVertices) == 2 % Deux sommets partagés indiquent une arête commune
                adjacentTriangles(end + 1) = i; % Ajouter le triangle à la liste des adjacents
            end
        end
    end
end
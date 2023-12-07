% Fonction pour lire un fichier STL
function [vertices, faces] = readSTL(filename)
    fid = fopen(filename, 'rt'); % Ouvrir le fichier en mode texte
    if fid == -1
        error('File not found or cannot be read'); % Erreur si le fichier n'est pas trouvé
    end
    
    vertices = []; % Initialiser le tableau des sommets
    faces = []; % Initialiser le tableau des faces
    vertexMap = containers.Map('KeyType','char', 'ValueType','int32');
    vertexIndex = 0;

    while true
        line = fgetl(fid); % Lire une ligne du fichier
        if ~ischar(line)
            break; % Arrêter si fin du fichier
        end
        line = strtrim(line); % Supprimer les espaces blancs

        if startsWith(line, 'facet')
            currentFaceVertices = []; % Commencer un nouveau facet
        elseif startsWith(line, 'vertex')
            vertex = sscanf(line, 'vertex %f %f %f')'; % Lire les coordonnées du sommet
            vertexKey = mat2str(vertex, 6); % Convertir le sommet en chaîne de caractères
            
            if ~isKey(vertexMap, vertexKey)
                vertexIndex = vertexIndex + 1;
                vertices(vertexIndex, :) = vertex; % Ajouter le sommet au tableau
                vertexMap(vertexKey) = vertexIndex; % Ajouter le sommet à la carte
            end

            currentFaceVertices(end + 1) = vertexMap(vertexKey); % Ajouter le sommet à la face actuelle
        elseif startsWith(line, 'endfacet')
            faces = [faces; currentFaceVertices]; % Ajouter la face au tableau des faces
        end
    end

    fclose(fid); % Fermer le fichier
end
En esta sección se detallan los resultados que se pueden obtener a partir del algoritmo de simulación, así como de algoritmos auxiliares de decisión y post-procesamiento.

# Resultados
Al seleccionar los resultados del algoritmo de simulación, se pueden elegir entre varias opciones. A continuación, se describen las alternativas disponibles.

* Final Fire Scar (Cicatriz final del fuego): Cicatriz final del incendio para cada simulación. El formato es archivos .asc
* Propagation Fire Scars (Cicatrices de propagación del fuego): Cicatriz para cada
paso de tiempo transcurrido del incendio, para cada simulación. Formato archivos .asc
* Propagation Directed Graph (Grafo dirigido de propagación): Grafo que indica la propagación del incendio (de qué pixel a qué pixel pasó el fuego). Formato .csv
* Ignition Points (Puntos de ignición): Los puntos en que empezó el fuego en cada simulación. Formato .csv
* Hit Rate of Spread (Tasa de propagación al impacto): Velocidad de propagación del fuego al momento de alcanzar la pixel quemada. Formato archivos .asc
* Flame Length (Longitud de la llama): La distancia medida desde la punta promedio de la llama hasta la mitad de la zona de combustión en la base del fuego. Formato archivos .asc
* Byram Intensity (Intensidad de Byram): La tasa de liberación de energía (o calor) por unidad de tiempo y por unidad de longitud del frente de fuego. Formato archivos .asc
* Crown Fire Scar (Cicatriz de fuego en la copa) Cicatriz final del fuego de copa para cada simulación. Formato archivos .asc
* Crown Fire Fuel Consumption (Proporción de consumo de combustible en fuego de copa). Formato archivos .asc
* Surface Burn Fraction (Fracción de quema superficial). Formato archivos .asc

![Despliegue de opciones](images/rya1.png)

![Selección de resultados](images/rya2.png)

# Algoritmos
## Algortimos de decisión
La caja de herramientas cuenta con una serie de algoritmos, ya sea para apoyar el proceso de toma de decisiones, o para realizar un post procesamiento de las simulaciones. Los resultados de los algoritmos pueden ser obtenidos en diversos formatos (GPKG, TIFF, SHP, etc.) y para visualizarlos se deben arrastrar las capas correspondientes a la pestaña de capas del proyecto de QGIS.

![Visualización de capas de resultados](images/capas.png)

* Raster knapsack optimization
* Polygon knapsack optimization : Optimiza el problema clásico de la mochila utilizando polígonos con atributos de valores y/o pesos, y devuelve una capa de polígonos con los polígonos seleccionados.
* Polygon treatment optimization : Usando los posibles tratamientos para cada polígono, maximiza el valor modificado de los polígonos tratados.
* Raster treatment optimization : Maximiza el valor modificado del raster tratado, decidiendo qué tratamiento aplicar a cada píxel (o no realizar cambios), sujeto a restricciones de presupuesto y área.
* Raster treatment \& teams optimization : Maximiza el valor modificado del raster tratado, decidiendo qué tratamiento aplicar y qué equipo asignar a cada píxel (o no realizar cambios), sujeto a restricciones de presupuesto, área y capacidades del equipo.

## Simulator Post Processing (simpp)

* Ignition Point(s) (Puntos de Ignición): Entrega los puntos de ignición en formato raster
* (Propagation) Fire Scar(s) (Cicatrices de propagación): A partir de las cicatrices finales se puede obtener la probabilidad de quema (Burn probability) y un raster/polígono de las cicatrices finales.
* Propagation Digraph (Digrafo de propagación)
* Spatial Statistics, cualquiera de: Hit Rate Of Spread, Flame Length, Byram Fire Line Intensity, Crown Fire Scar, Crown Fire Fuel Consumption Ratio, Surface Burn Fraction

A continuación se presenta la visualización de las capas de probabilidad de quema y puntos de ignición, usando los correspondientes algoritmos y una instancia correspondiente a 1.000 incendios en la zona de Villarica.

![Instancia de Villarica con puntos de ignición y probabilidad de quema](images/villarica.png)

## simpp Risk Metrics

* DownStream Protection Value: Raster con el valor de protección ``aguas abajo`` para cada pixel según capa de valores en riesgo, para más información visitar la documentación.
* Betweenness Centrality: Medida propia de grafos que determina hasta qué punto un vértice se encuentra en los caminos entre otros vértices.
* Burn Probability: Probabilidad de quema de cada pixel calculada como la cantidad de veces que se quemó dicho pixel entre todas las simulaciones realizadas.


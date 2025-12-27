En esta sección se detalla la instalación de QGIS y de la caja de herramientas de Fire Analytics.

\subsection{Instalación de QGIS}
A continuación se detalla la instalación de QGIS y los requerimientos de paquetes para los diferentes sistemas operativos.

\subsubsection{Windows}
Para la instalación en Windows hay dos opciones:
\\ \\ Instalación desde \href{https://qgis.org/en/site/forusers/download.html#windows}{\underline{enlace}}. Se recomienda la última versión estable.

Para poder ocupar las funciones del Plugin, también es necesario instalar algunas librerías, esto se hace mediante el ambiente de Python que incluye QGIS. A continuación se detallan los pasos a seguir:
\begin{enumerate}
    \item Guardar el siguiente archivo \href{https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/requirements.txt}{requeriments.txt} (segundo click y guardar enlace como)
    \item Activar el python de QGIS 
    \item Escribir 
    \begin{listing}[h!]
        \begin{minted}{python}
        !pip install --upgrade fire2a-lib
        \end{minted}
        \label{listing:py}
        \end{listing} y presionar ENTER (ajustar ruta para indicar la ubicación del archivo de requerimientos).
\end{enumerate}


\subsubsection{MacOS}
Para la instalación en MacOS, descargar del siguiente \href{https://qgis.org/en/site/forusers/download.html#mac}{enlace}.

Instalar requerimientos:
\begin{enumerate}
    \item Guardar el siguiente archivo \href{https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/requirements.txt}{requeriments.txt} (segundo click y guardar enlace como).
    \item Abrir terminal

\begin{listing}[h!]
\begin{minted}{python}
# go to QGIS python location
% cd /Applications/QGIS.app/Contents/MacOS/bin
# install into qgis python environment
% ./python3 -m pip install -r ~/Downloads/requirements.txt
# matplotlib bug: can't find qt_backend
% ./python3 -m pip install --upgrade matplotlib
\end{minted}
\label{listing:py}
\end{listing}
\end{enumerate}

\subsubsection{Linux}
En Linux hay tres alternativas:
\begin{enumerate}
    \item Gnome: Super (or Meta) Key > escribir 'QGIS' >  Clickear 'Install' en la ventana del software
    \item Synaptic: Buscar QGIS, clickear install
    \item Terminal: 
    \begin{listing}[H]
    \begin{minted}{python}
    sudo apt install qgis qgis-plugin-grass
    \end{minted}
    \label{listing:py}
    \end{listing}
\end{enumerate}

Instalación de requerimientos: 
\\ Descargar \href{https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/fireanalyticstoolbox/requirements.txt}{requerimientos.txt}, \href{https://raw.githubusercontent.com/fire2a/fire-analytics-qgis-processing-toolbox-plugin/main/requirements.dev.txt}{requirements.dev.txt} y Correr la siguiente línea en el terminal:
\begin{listing}[h!]
    \begin{minted}{python}
    -m venv --system-site-packages -r requirements.txt, requirements.dev.txt
    \end{minted}
    \label{listing:py}
    \end{listing}

\subsection{Instalación del Fire Anlytics Toolbox}
\begin{enumerate}
    \item Añadir \href{https://fire2a.github.io/fire-analytics-qgis-processing-toolbox-plugin/plugins.xml}{\underline{enlace}} del plugin a la pestaña de fuentes personalizables:
    \\ Menú: Plugins > Manage and Install Plugins... > Settings > Plugin Repositories Add > llenar Nombre y pegar URL > Ok

\begin{figure}[H]
\centering
\includegraphics[width=0.7\textwidth]{images/tldr_add_plugin_source.png}
\caption{\label{fig:frog} Menú de plugins personalizables}
\end{figure}

\item Instalar nuevo plugin: 
\\ Menú: Plugins > Manage and Install Plugins... > Not installed > search box fire > select > Install Plugin > Ok

\end{enumerate}

Si el plugin no aparece inmediatamente:
\\ A. Marcar la casilla del plugin en la sección de plugins instalados.
\\ B. Reiniciar QGIS

--[[
************************************************************************

localization-es.lua

File date: 2020-09-29T23:06:50Z
File revision: 
Project revision: 331
Project version: r331


Author: Angelike
Translators: NeKRoMaNT (contacto@nekromant.com), yllelde, maqjav

************************************************************************
]]--

local L = LibStub("AceLocale-3.0"):NewLocale((...), "esES")

if (not L) then
    return
end

-- general
L[" |cffff0000Disabled by|r"] = " |cffff0000Desactivado por|r"
L["(Done)"] = "(Hecho)"
--[[Translation missing --]]
--[[ L["Abandon a quest"] = ""--]] 
--[[Translation missing --]]
--[[ L["Accept a new quest"] = ""--]] 
L["Active Tracker"] = "Rastreador Activo"
L["Add New Quests"] = "Añade Nuevas Misiones"
L["Add Untracked"] = "Añade No Rastreadas"
L["Allow the plugin to color its text."] = "Permitir al plugin colorear su texto"
L["Always Open Maximized"] = "Siempre abrir maximizado"
L["Always Open Minimized"] = "Siempre abrir minimizado"
L["Attach the plugin to the minimap instead of the panel."] = "Adjuntar el plugin al minimapa en lugar de al panel"
L["Attach to minimap"] = "Adjuntar al minimapa"
L["Auto Complete Quest"] = "Autocompletar Misión"
L["Auto Resize Tracker"] = "Cambiar tamaño del rastreador automáticamente"
L["Automatical add new Quests to tracker"] = "Añade nuevas misiones automáticamente al rastreador"
L["Automatical add quests with updated objectives to tracker"] = "Añade automáticamente las misiones con objetivos actualizados al rastreador"
L["Automatical hide completed objectives in tracker"] = "Ocultar automáticamente los objetivos completados en el rastreador"
L["Automatical remove completed quests from tracker"] = "Borrar automáticamente las misiones completadas del rastreador"
L["Automatical resizes the tracker depending on the lenght of the text in it"] = "Cambia el tamaño del rastreador de forma automática dependiendo de la longitud del texto"
L["Automatically Complete Quests"] = "Completa las misiones automáticamente"
L["Background"] = "Fondo"
L["Background Color"] = "Color de Fondo"
L["Background Corner Color"] = "Color de Fondo de Bordes"
L["Bayi's Extended Quest Log"] = "Registro de Misiones Extendido de Bayi"
L["Center"] = "Centro"
L["Change Locale (needs Interface Reload)"] = "Cambiar idioma (necesita recargar el interfaz)"
L["Changes the font size of the tracker"] = "Cambia el tamaño de la fuente del rastreador"
L["Click to open Quest Log"] = "Haz click para abrir el Registro de Misiones"
L["Close"] = "Cerrar"
L["Close the menu."] = "Cierra el menú"
--[[Translation missing --]]
--[[ L["Color Objectives"] = ""--]] 
L["Colors"] = "Colores"
--[[Translation missing --]]
--[[ L["Complete"] = ""--]] 
--[[Translation missing --]]
--[[ L["Complete a quest"] = ""--]] 
L["Completed Header Color"] = "Color Cabecera Completada"
L["Completed Objective Color"] = "Color Objetivo Completado"
L["Completed!"] = "Completada!"
L["Completion Sound"] = "Sonido de misión completada"
L["Custom Background Color"] = "Color de Fondo Personalizado"
L["Custom Header Color"] = "Color Cabecera Personalizado"
L["Custom Objective Color"] = "Color de Objetivo Personalizado"
L["Custom Zone Color"] = "Color de Zona Personalizado"
L["Customize the Objective/Quest Markers"] = "Personaliza los marcadores del objetivo/misión"
--[[Translation missing --]]
--[[ L["Deep scan for quest"] = ""--]] 
--[[Translation missing --]]
--[[ L["Default chat for actual group"] = ""--]] 
L["Detach the tooltip from the panel."] = "Quitar el tooltip del panel"
L["Detach tooltip"] = "Quitar tooltip"
L["Disable the Tracker"] = "Desactiva el rastreador"
L["Disable Tracker"] = "Desactiva Rastreador"
L["Display Markers before objectives"] = "Muestra los marcadores antes de los objetivos"
L["Displays the actual quest's description in the tracker tooltip"] = "Mostrar la descripción actual de la misión en el tooltip del rastreador"
L["Don't play a sound"] = "No reproducir un sonido"
L["Enable Addon"] = "Activar Addon"
--[[Translation missing --]]
--[[ L["Enable Debug"] = ""--]] 
--[[Translation missing --]]
--[[ L["Enable Language support"] = ""--]] 
L["Enable Left Click"] = "Activar Click Izquierdo"
--[[Translation missing --]]
--[[ L["Enable Quest Progression to Party Chat"] = ""--]] 
--[[Translation missing --]]
--[[ L["Enable Questlog"] = ""--]] 
L["Enable Right Click"] = "Activar Click Derecho"
--[[Translation missing --]]
--[[ L["Enable the Questlog"] = ""--]] 
L["Enable this Addon"] = "Activar este Addon"
--[[Translation missing --]]
--[[ L["Enables the language support for non-natural Languages."] = ""--]] 
--[[Translation missing --]]
--[[ L["Extended Quest Log"] = ""--]] 
L["Fade Colors"] = "Colores Atenuados"
L["Fade the objective colors"] = "Atenúa los colores del objetivo"
--[[Translation missing --]]
--[[ L["Fade-Step-Color"] = ""--]] 
L["Failed Header Color"] = "Color cabecera fallida"
--[[Translation missing --]]
--[[ L["Finalize a quest."] = ""--]] 
L["Fixed Tracker Width"] = "Ancho Fijo del Rastreador"
L["Font Size"] = "Tamaño de Fuente"
L["Force the quest log to open maximized"] = "Fuerza el registro de misiones para abrirse siempre maximizado"
L["Force the quest log to open minimized"] = "Fuerza el registro de misiones para abrirse siempre minimizado"
L["Force Tracker Unlock"] = "Fuerza la desactivación del rastreador"
--[[Translation missing --]]
--[[ L["GameTooltip"] = ""--]] 
L["General Quest Log Options"] = "Opciones Generales del Registro de Misiones"
--[[Translation missing --]]
--[[ L["Group chat"] = ""--]] 
L["Header Color"] = "Color Cabecera"
L["Hidden"] = "Oculto"
L["Hide Completed Objectives"] = "Ocultar Objetivos Completados"
L["Hide Objectives for Completed only"] = "Oculta Objetivos Sólo Completadas"
L["Hide objectives only for completed quests"] = "Oculta los objetivos sólo para las misiones completadas"
--[[Translation missing --]]
--[[ L["Incomplete"] = ""--]] 
L["Info on Quest Completion"] = "Informa al completar misión"
L["Item Tooltip Quest Info"] = "Información Misión en Tooltip de Objeto"
L["Left"] = "Izquierda"
L["Left clicking a quest in the tracker opens the Quest Log"] = "Al hacer click izquierdo en una misión en el rastreador se abre el registro de misiones"
L["List Type"] = "Tipo de Listado"
L["Lock Quest Log"] = "Bloquear Registro de Misiones"
L["Lock the tooltips position. When the tooltip is locked, you must use Alt to access it with your mouse."] = "Bloquea la posición del tooltip. Cuando el tooltip se bloquea, puedes usar Alt para acceder a él con tu ratón."
L["Lock tooltip"] = "Bloquear tooltip"
L["Lock Tracker"] = "Bloquear Rastreador"
L["Main Options"] = "Opciones Principales"
L["Make the Tracker movable even with CTMod loaded. Please check your CTMod config before using it"] = "Hace posible el movimiento del rastreador incluso con CTMod cargado. Por favor, revisa tu configuración de CTMod antes de usarlo"
L["Makes the quest log unmovable"] = "Impide que pueda moverse el Registro de Misiones"
L["Makes the quest tracker unmovable"] = "Impide que pueda moverse el rastreador de misiones"
L["Markers"] = "Marcadores"
L["Minimap"] = "Minimapa"
L["Mob Tooltip Quest Info"] = "Información Misión en Tooltip de Monstruo"
L["Mouse Events"] = "Eventos del Ratón"
L["No Objectives!"] = "Sin Objetivos"
L["No sound"] = "Sin Sonido"
--[[Translation missing --]]
--[[ L["Non Objective"] = ""--]] 
L["NPC color"] = "Color del PNJ"
L["Number of Lines"] = "Número de Líneas"
--[[Translation missing --]]
--[[ L["Number of lines that can be used by the Linemanger"] = ""--]] 
L["Objective Color"] = "Color de Objetivo"
L["Options related to the Quest Log"] = "Opciones relacionadas con el Registro de Misiones"
L["Options related to the Quest Tracker"] = "Opciones relacionadas con el rastreador de misiones"
L["Other"] = "Otro/a"
--[[Translation missing --]]
--[[ L["Other Tooltip Quest Info"] = ""--]] 
L["Party Member Color"] = "Color Miembro Grupo"
--[[Translation missing --]]
--[[ L["Party member on Quest:"] = ""--]] 
L["Party Member with Quixote Color"] = "Color Miembro Grupo con Quixote instalado"
L["Party Quest Progression info"] = "Información del progreso de la misión del grupo"
L["Pick Locale"] = "Selecciona Idioma"
L["Position"] = "Posición"
L["Position the plugin on the panel."] = "Posición del plugin en el panel"
--[[Translation missing --]]
--[[ L["Print a chat massage when an objective of a quest is updated."] = ""--]] 
--[[Translation missing --]]
--[[ L["Print a chat massage when you abandon a quest."] = ""--]] 
--[[Translation missing --]]
--[[ L["Print a chat massage when you accept a new quest."] = ""--]] 
--[[Translation missing --]]
--[[ L["Print a chat massage when you complete all quest objectives."] = ""--]] 
--[[Translation missing --]]
--[[ L["Print a chat massage when you deliver a completed quest to the NPC."] = ""--]] 
--[[Translation missing --]]
--[[ L["Print a chat message when you accept a new quest."] = ""--]] 
L["Prints the Quest Progression Status to the Party Chat"] = "Muestra el progreso de la misión al chat del grupo"
L["Profiles"] = "Perfiles"
--[[Translation missing --]]
--[[ L["Progess of a quest"] = ""--]] 
--[[Translation missing --]]
--[[ L["Quest %d finished."] = ""--]] 
--[[Translation missing --]]
--[[ L["Quest %s done."] = ""--]] 
--[[Translation missing --]]
--[[ L["Quest abandoned: "] = ""--]] 
--[[Translation missing --]]
--[[ L["Quest accepted: "] = ""--]] 
--[[Translation missing --]]
--[[ L["Quest Accepted: "] = ""--]] 
L["Quest Description Color"] = "Color Descripción Misión"
L["Quest Description in Tracker Tooltip"] = "Descripción de misión en tooltip de rastreador"
--[[Translation missing --]]
--[[ L["Quest finalized: "] = ""--]] 
L["Quest Log Alpha"] = "Transparencia Registro Misiones"
L["Quest Log Options"] = "Opciones de Registro de Misiones"
L["Quest Log Scale"] = "Escala del Registro de Misiones"
--[[Translation missing --]]
--[[ L["Quest Log Style"] = ""--]] 
--[[Translation missing --]]
--[[ L["Quest objective updated: "] = ""--]] 
L["Quest Progression to Party Chat"] = "Mostrar progreso de misiones al chat del grupo"
L["Quest Tracker"] = "Rastreador de Misiones"
L["Quest Tracker Alpha"] = "Transparencia Rastreador"
L["Quest Tracker Options"] = "Opciones del rastreador de misiones"
--[[Translation missing --]]
--[[ L["Questlog Layout"] = ""--]] 
L["Reload UI ?"] = "Recargar Interfaz ?"
L["Remove Completed Quests"] = "Borrar Misiones Completadas"
L["Requires Interface Reload"] = "Requiere recargar el interfaz"
--[[Translation missing --]]
--[[ L["Reset questlog position"] = ""--]] 
L["Reset tracker position"] = "Resetear Posición Rastreador"
L["Right"] = "Derecha"
L["Right clicking a quest in the tracker removes it from the tracker"] = "Al hacer click derecho en una misión en el rastreador se borra del rastreador"
--[[Translation missing --]]
--[[ L["say quest progession"] = ""--]] 
--[[Translation missing --]]
--[[ L["Scans the full quest for tooltip info occurence"] = ""--]] 
--[[Translation missing --]]
--[[ L["Select chattype"] = ""--]] 
L["Select the sound to be played when a quest is completed"] = "Selecciona el sonido que se reproduce cuando una misión se completa"
L["Set the type of listing"] = "Ajusta el tipo de listado"
L["Set the type of symbol"] = "Ajusta el tipo de símbolo"
L["Set tracker Colors"] = "Ajusta los colores del rastreador"
L["Sets the Alpha of the Quest Log"] = "Ajusta la transparencia del registro de misiones"
L["Sets the Alpha of the Quest Tracker"] = "Ajusta la transparencia del rastreador de misiones"
L["Sets the Background Color"] = "Ajusta el color de fondo"
L["Sets the Background Corner Color"] = "Ajusta el color de fondo de los bordes"
L["Sets the color for completed headers"] = "Ajusta el color para las cabeceras completadas"
L["Sets the color for completed objectives"] = "Ajusta el color para los objetivos completados"
L["Sets the color for failed quests"] = "Elige el color para misiones fallidas"
L["Sets the color for headers"] = "Ajusta el color para las cabeceras"
L["Sets the color for objectives"] = "Ajusta el color para los objetivos"
L["Sets the color for Party member"] = "Ajusta el color para el miembro del grupo"
L["Sets the color for the Quest description"] = "Ajusta el color para la descripción de la misión"
L["Sets the fixed width of the tracker if auto resize is disabled"] = "Ajusta el ancho fijo del rastreador si el cambio de tamaño automático está desactivado"
L["Sets the Scale of the Quest Log"] = "Ajusta la escala del Registro de Misiones"
L["Sets the zone color"] = "Ajusta el color de zona"
L["Show colored text"] = "Mostrar texto con colores"
--[[Translation missing --]]
--[[ L["Show hint tooltip"] = ""--]] 
L["Show icon"] = "Mostrar icono"
L["Show Objective Markers"] = "Muestra Marcadores Objetivo"
L["Show quest info in item tooltips"] = "Muestra información sobre la misión en los cuadros de datos de los objetos"
L["Show quest info in mob tooltips"] = "Muestra información sobre la misión en los cuadros de datos de los monstruos"
--[[Translation missing --]]
--[[ L["Show quest info on other tooltips"] = ""--]] 
L["Show Quest Level"] = "Mostrar nivel de misión"
--[[Translation missing --]]
--[[ L["Show Quest Tags"] = ""--]] 
L["Show Quest Zones"] = "Mostrar Zonas"
L["Show text"] = "Mostrar texto"
L["Show the plugins icon on the panel."] = "Mostrar el icono del plugin en el panel"
L["Show the plugins text on the panel."] = "Mostrar el texto del plugin en el panel"
L["Show the quests zone it belongs to above its name"] = "Muestra la zona de la misión a la que pertenece sobre su nombre"
L["Show tooltip"] = "Mostrar tooltip"
L["Show Tracker Header"] = "Mostrar cabecera del rastreador"
L["Showing mouseover tooltips in tracker"] = "Mostrar tooltip en rastreador al pasar el ratón"
L["Showing on mouseover tooltips, clicking opens the tracker, rightclicking removes the quest from tracker"] = "Muestra el tooltip al pasar el ratón por encima, haciendo click abre el rastreador, botón derecho elimina la misión del rastreador"
L["Shows a message and plays a sound when you complete a quest"] = "Muestra un mensaje y reproduce un sonido cuando completas una misión"
L["Shows the quests level"] = "Mostrar el nivel de las misiones"
--[[Translation missing --]]
--[[ L["Shows the short verion of the tag"] = ""--]] 
L["Shows the trackers header"] = "Muestra la cabecera del rastreador"
L["Simple Quest Log"] = "Registro de Misiones Simple"
L["Sort the quests in tracker"] = "Ordena las misiones en el rastreador"
L["Sort Tracker Quests"] = "Ordena Misiones del Rastreador"
L["Symbol Type"] = "Tipo de Símbolo"
--[[Translation missing --]]
--[[ L["The chattype to post progress massages."] = ""--]] 
--[[Translation missing --]]
--[[ L["The default appearance of the quest log."] = ""--]] 
L["Title color"] = "Color del Título"
L["Tooltip"] = "Tooltip"
L["Tooltip Options"] = "Opciones de Tooltip"
L["Tracker Tooltip"] = "Tooltip de Rastreador"
L["Use Background"] = "Utilizar fondo"
L["Use custom color for background"] = "Utiliza un color personalizado para el fondo"
L["Use custom color for headers"] = "Utiliza un color personalizado para las cabeceras"
L["Use custom color for objective text"] = "Utiliza un color personalizado para el texto de objetivo"
L["Use custom color for Zone names"] = "Utiliza un color personalizado para los nombres de zona"
--[[Translation missing --]]
--[[ L["Use Fade-Step-Color"] = ""--]] 
L["Use Listing"] = "Utilizar Listado"
L["Use Quest Level Colors"] = "Utilizar Colores de Nivel en Misiones"
L["Use the colors to indicate quest difficulty"] = "Utiliza los colores para indicar la dificultad de la misión"
L["User Listing rather than symbols"] = "Utiliza un listado en vez de los símbolos"
L["Uses the default Blizzard Quest Log"] = "Utiliza el registro de misiones por defecto de Blizzard"
L["Watch Options"] = "Opciones de Revisión"
L["Zone Color"] = "Color de zona"
L["Zones"] = "Zonas"


-- chat
-- chat
--[[Translation missing --]]
--[[ L["Quest failed: "] = ""--]] 


-- icon
-- icon
L["|cff00d000Completed Quests|r"] = "|cff00d000Misiones|r Completadas"
L["|cffeda55fClick|r to open Quest Log."] = "|cffeda55fHaz click|r para abrir el registro de misiones y |cffeda55fhaz click + mays|r para abrir la configuración de Waterfall"
L["|cffeda55fRightclick|r to open Icon config."] = " . |cffeda55fClicDerecho|r para abrir la configuración de FuBar."
--[[Translation missing --]]
--[[ L["|cffeda55fShift+Click|r to open beql config."] = ""--]] 
L["|cffff8000Tracked Quests|r"] = "|cffff8000Misiones|r Supervisadas"
L["|cffffffffQuests|r"] = "|cffffffffMisiones|r"
L["Hide plugin"] = "Ocultar plugin"
L["Hide the plugin from the panel or minimap, leaving the addon running."] = "Ocultar el plugin del panel o minimapa, dejando funcionando el addon"
L["Icon Config"] = "Configuración FubarPlugin"
L["Minimap position"] = "Posición Minimapa"
L["Show Icon Tooltip"] = "Mostrar Tooltip en FuBar"
L["Shows the tooltip on mousover this plugin"] = "Mostrar el tooltip al poner el cursor encima de este plugin"


-- EOF --

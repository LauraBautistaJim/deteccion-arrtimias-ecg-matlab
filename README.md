# Detección de Arritmias Cardiacas en ECG usando MATLAB

Este repositorio contiene la implementación de un algoritmo para la detección de complejos QRS y el análisis de arritmias cardíacas (bradicardia y taquicardia) a partir de señales de electrocardiograma (ECG), utilizando registros de la base de datos **MIT-BIH Arrhythmia Database**.

El proyecto fue desarrollado en **MATLAB** como parte de un trabajo académico en el área de procesamiento de señales biomédicas.

---

## Objetivo del proyecto

Desarrollar e implementar un algoritmo de procesamiento digital de señales que permita:

- Filtrar señales ECG.
- Detectar complejos QRS.
- Calcular la frecuencia cardiaca.
- Identificar eventos de bradicardia y taquicardia.
- Visualizar los resultados mediante gráficas.

---

## Metodología

1. **Carga de datos**
   - Se utilizan registros ECG de la base de datos MIT-BIH (ej. registro 100).
   - Los archivos `.dat` y `.hea` se leen directamente desde MATLAB.

2. **Preprocesamiento**
   - Eliminación de componente DC.
   - Filtrado pasa banda entre 5 y 15 Hz para resaltar el complejo QRS.

3. **Detección de QRS**
   - Se emplea la función `findpeaks` con umbrales de amplitud y distancia mínima entre picos.

4. **Análisis de frecuencia cardiaca**
   - Cálculo de intervalos RR.
   - Conversión a frecuencia cardiaca en bpm.

5. **Detección de arritmias**
   - Bradicardia: FC < 60 bpm.
   - Taquicardia: FC > 100 bpm.

---

## Resultados

El algoritmo genera:

- Gráfica del ECG completo con QRS detectados.
- Visualización detallada en una ventana de 10 segundos.
- Histograma de la distribución de la frecuencia cardiaca.
- Valores numéricos de frecuencia cardiaca promedio y eventos de arritmia detectados.

---

## Contenido del repositorio

- `DETECTORDEARRITMIAS.m`  
  Script principal en MATLAB para el procesamiento y análisis del ECG.

- `100.dat`, `100.hea`, `100.atr`  
  Archivos correspondientes a los registros 100 - 111 de la base de datos MIT-BIH.

---

## Requisitos

- MATLAB R2020 o superior (recomendado).
- No es necesario hardware adicional (Arduino u otros dispositivos).
- Señales ECG obtenidas de la base de datos MIT-BIH.

---

## Base de datos utilizada

MIT-BIH Arrhythmia Database  
PhysioNet: https://physionet.org/content/mitdb/1.0.0/

---

## Autor

**Laura Shunashi Bautista Jiménez**  
Estudiante de Ingeniería Biomédica

---

## ⚠️ Nota

Este proyecto tiene fines académicos y educativos. No debe utilizarse como herramienta de diagnóstico clínico.

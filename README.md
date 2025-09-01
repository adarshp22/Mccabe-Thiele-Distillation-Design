# 🏭 Distillation Column Design & Analysis

## 📋 Overview

This MATLAB project implements a comprehensive **distillation column design and analysis** using the **McCabe-Thiele method**. The code performs equilibrium curve fitting, operating line calculations, and theoretical tray determination for a multi-section distillation column with side stream withdrawal.

## 🎯 Features

- **📈 Equilibrium Curve Modeling**: Fits experimental VLE data using curve fitting techniques
- **📊 Operating Line Construction**: Calculates and plots operating lines for all column sections
- **🔧 McCabe-Thiele Analysis**: Automated stage-by-stage calculation using graphical method
- **⚖️ Material Balance**: Solves overall and component material balances
- **📐 Reflux Ratio Optimization**: Determines minimum reflux ratio and operating reflux ratio
- **🎨 Comprehensive Visualization**: Generates detailed plots with all construction lines

## 🛠️ System Requirements

- MATLAB R2020a or later
- Optimization Toolbox
- Curve Fitting Toolbox

## 📁 Project Structure

```
distillation-column-analysis/
├── main.m                   # Main analysis script
├── Equasolve.m              # Material balance solver function
├── images/                  # Generated plots and visualizations
    ├── plot.png

```

## 🚀 Getting Started

### Prerequisites

Make sure you have MATLAB installed with the required toolboxes:
- Optimization Toolbox (for `lsqcurvefit` and `fsolve`)
- Basic MATLAB (for plotting and calculations)

### Running the Analysis

1. **Clone or download** the project files
2. **Open MATLAB** and navigate to the project directory
3. **Run the main script**:
   ```matlab
   main
   ```

## 📊 Input Parameters

### Feed Specifications 🍯
- **Flow rate (F)**: 500 kmol/h
- **Composition (zf)**: 0.45 mole fraction
- **Thermal condition (qf)**: 0.8

### Side Stream Parameters 🔄
- **Flow rate (S)**: 50 kmol/h  
- **Composition (xs)**: 0.7 mole fraction
- **Thermal condition (qs)**: 1.0 (saturated liquid)

### Product Specifications 🎯
- **Distillate composition (xd)**: 0.97 mole fraction
- **Bottoms composition (xw)**: 0.02 mole fraction

## 📈 Analysis Steps

1. **🔬 VLE Data Fitting**: Fits equilibrium data to mathematical model
2. **⚖️ Material Balance**: Solves for product flow rates (D, W)
3. **📐 Operating Lines**: Constructs operating lines for all three sections
4. **🔄 Reflux Calculations**: Determines minimum and operating reflux ratios
5. **📊 McCabe-Thiele Construction**: Performs graphical stage calculation
6. **📋 Results Summary**: Reports total stages and feed/side stream locations

## 🖼️ Images

### Equilibrium Curve

*VLE equilibrium curve with experimental data points and fitted model*

<img src="images/eqm.png" alt="Equilibrium Curve Diagram" width="600">


### McCabe-Thiele Diagram

*Complete McCabe-Thiele construction showing all operating lines and theoretical stages*

<img src="images/plot.png" alt="Equilibrium Curve Diagram" width="600">


## 📊 Expected Results

The analysis will output:
- **🔢 Total number of ideal trays**: ~15-20 stages
- **📍 Feed tray location**: Middle section of the column
- **🔄 Side stream tray**: Upper section of the column  
- **📈 Reflux ratio**: 2.5 × minimum reflux ratio
- **⚖️ Product flow rates**: D and W values from material balance

## 🧮 Mathematical Models

### Equilibrium Relationship
```
y = (a·x) / (1 + b·x + c·x²)
```

### Operating Line Equations
- **Section 1**: `y = (R/(R+1))·x + xd/(R+1)`
- **Section 2**: `y = (L2/V2)·x + (y1 - L2·xs/V2)`
- **Section 3**: `y = (L3/V3)·x + (xw - L3·xw/V3)`

## 🤝 Contributing

Feel free to contribute by:
- 🐛 Reporting bugs
- 💡 Suggesting enhancements
- 🔧 Improving code efficiency
- 📚 Adding documentation

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👨‍💻 Author

**Aadityaamlan Panda** 🎓  
B Tech, Chemical Engineering  
Indian Institute of Technology, Kanpur, India 🇮🇳

***

**⭐ Star this repo if you find it helpful!**

## 🏷️ Keywords

`distillation` `chemical-engineering` `matlab` `mccabe-thiele` `vapor-liquid-equilibrium` `process-design` `separation` `mass-transfer`﻿# McCabe-Thiele



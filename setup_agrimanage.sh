#!/bin/bash

# Print commands and their arguments as they are executed
set -x

# Exit immediately if a command exits with a non-zero status
set -e

# Create a new React Native project using Expo
npx create-expo-app AgriManage
cd AgriManage

# Install necessary dependencies
npm install @react-navigation/native @react-navigation/bottom-tabs react-native-safe-area-context react-native-screens
npm install react-native-paper react-native-vector-icons

# Create directory structure
mkdir -p src/screens src/components

# Create main App.tsx file
cat > App.tsx << EOL
import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';

import DashboardScreen from './src/screens/DashboardScreen';
import CropManagementScreen from './src/screens/CropManagementScreen';
import LivestockManagementScreen from './src/screens/LivestockManagementScreen';
import TaskManagementScreen from './src/screens/TaskManagementScreen';
import InventoryScreen from './src/screens/InventoryScreen';
import FinancialScreen from './src/screens/FinancialScreen';
import ReportScreen from './src/screens/ReportScreen';

const Tab = createBottomTabNavigator();

export default function App() {
  return (
    <SafeAreaProvider>
      <NavigationContainer>
        <Tab.Navigator
          screenOptions={({ route }) => ({
            tabBarIcon: ({ focused, color, size }) => {
              let iconName;

              if (route.name === 'Dashboard') {
                iconName = focused ? 'view-dashboard' : 'view-dashboard-outline';
              } else if (route.name === 'Crops') {
                iconName = focused ? 'sprout' : 'sprout-outline';
              } else if (route.name === 'Livestock') {
                iconName = focused ? 'cow' : 'cow-outline';
              } else if (route.name === 'Tasks') {
                iconName = focused ? 'clipboard-check' : 'clipboard-check-outline';
              } else if (route.name === 'Inventory') {
                iconName = focused ? 'package-variant' : 'package-variant-outline';
              } else if (route.name === 'Financial') {
                iconName = focused ? 'cash' : 'cash-outline';
              } else if (route.name === 'Report') {
                iconName = focused ? 'file-chart' : 'file-chart-outline';
              }

              return <Icon name={iconName} size={size} color={color} />;
            },
          })}
        >
          <Tab.Screen name="Dashboard" component={DashboardScreen} />
          <Tab.Screen name="Crops" component={CropManagementScreen} />
          <Tab.Screen name="Livestock" component={LivestockManagementScreen} />
          <Tab.Screen name="Tasks" component={TaskManagementScreen} />
          <Tab.Screen name="Inventory" component={InventoryScreen} />
          <Tab.Screen name="Financial" component={FinancialScreen} />
          <Tab.Screen name="Report" component={ReportScreen} />
        </Tab.Navigator>
      </NavigationContainer>
    </SafeAreaProvider>
  );
}
EOL

# Create screen files
for screen in Dashboard CropManagement LivestockManagement TaskManagement Inventory Financial Report; do
  cat > src/screens/${screen}Screen.tsx << EOL
import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

export default function ${screen}Screen() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>${screen}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
  },
});
EOL
done

# Create WeatherInfo component
cat > src/components/WeatherInfo.tsx << EOL
import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';

export default function WeatherInfo() {
  return (
    <View style={styles.container}>
      <Icon name="weather-sunny" size={24} color="#FFD700" />
      <Text style={styles.temperature}>72°F</Text>
      <View style={styles.details}>
        <View style={styles.detailRow}>
          <Icon name="weather-cloudy" size={16} color="#666" />
          <Text style={styles.detailText}>20% chance of rain</Text>
        </View>
        <View style={styles.detailRow}>
          <Icon name="water-percent" size={16} color="#666" />
          <Text style={styles.detailText}>60% humidity</Text>
        </View>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  temperature: {
    fontSize: 24,
    fontWeight: 'bold',
    marginLeft: 8,
  },
  details: {
    marginLeft: 8,
  },
  detailRow: {
    flexDirection: 'row',
    alignItems: 'center',
    marginTop: 4,
  },
  detailText: {
    fontSize: 12,
    marginLeft: 4,
  },
});
EOL

echo "AgriManage project setup complete!"

# Run the project
npx expo start

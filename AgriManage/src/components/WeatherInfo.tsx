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

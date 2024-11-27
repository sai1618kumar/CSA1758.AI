Aim:
The aim of the program is to solve the Traveling Salesman Problem (TSP) using a brute-force approach. 
The goal is to find the shortest path that visits all given points exactly once and returns to the starting point.
Algorithm:
1. Problem Representation:
Represent the points as a dictionary where keys are the point names (e.g., 'A', 'B') and values are their 2D coordinates (e.g., (x, y)).
O(n) for storing the path and calculations.
For a Path:
Calculate the total distance by summing the distances between consecutive points in the path, including the return to the starting point.
3. Brute-Force TSP:
Generate All Permutations:
Use the itertools.permutations function to generate all possible orders of visiting the points.
Evaluate Each Order:
For each permutation of points:
Compute the total distance for that order.
Compare it to the current minimum distance and update the optimal order if the distance is smaller.
4. Return Results:
Return the minimum distance and the optimal visiting order of points.
Code:
from itertools import permutations
def get_user_input():
    """Function to take user input for the distance matrix."""
    try:
        # Input the number of cities
        num_cities = int(input("Enter the number of cities: "))
        if num_cities < 2:
            raise ValueError("Number of cities must be at least 2.")      
        # Input the distance matrix
        print("Enter the distance matrix row by row (space-separated):")
        dist_matrix = []
        for i in range(num_cities):
            row = list(map(int, input(f"Enter distances from city {i} to other cities: ").split()))
            if len(row) != num_cities:
                raise ValueError("Each row must have distances for all cities.")
            dist_matrix.append(row)
        
        return dist_matrix
    except ValueError as e:
        print(f"Invalid input: {e}")
        exit()

def tsp(dist_matrix):
    def total_distance(path):
        return sum(dist_matrix[path[i]][path[(i + 1) % len(path)]] for i in range(len(path)))
    
    return min((total_distance(p), p) for p in permutations(range(len(dist_matrix))))

# Main program
dist_matrix = get_user_input()
min_distance, shortest_path = tsp(dist_matrix)

print("Shortest path:", shortest_path)
print("Minimum distance:", min_distance)

Output:
Enter the number of cities: 3
Enter the distance matrix row by row (space-separated):
Enter distances from city 0 to other cities: 1 0 1
Enter distances from city 1 to other cities: 2 0 1
Enter distances from city 2 to other cities: 1 0 1
Shortest path: (0, 1, 2)
Minimum distance: 2

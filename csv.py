import csv

def analyze_csv(csv_file, threshold):
    with open(csv_file, 'r') as file:
        reader = csv.DictReader(file)

        for row in reader:
            name = row['name']
            age = int(row['age'])
            grades = [int(grade) for grade in row['grade'].split(',')]
            average_grade = sum(grades) / len(grades)

            if average_grade > threshold:
                print(f"{name}'s average grade is {average_grade}, which is above the threshold.")

# Example usage with a local CSV file
csv_file_path = 's3://natwestassessment'
threshold_value = 80  # Set your desired threshold
analyze_csv(csv_file_path, threshold_value)

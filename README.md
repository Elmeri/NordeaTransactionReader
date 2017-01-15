# NordeaTransactionReader

Script for reading account data from nordea accounts. From Nordea Online Banking service you can download txt-file that includes transaction data. This script is able to read it and provide summary of it.

First, use data_manipulation.py to format data to more suitable form.

Run command for data formatting:

    python data_manipulation.py <input_file_name> <output_file_name>

Run command:

    Rscript read.R <input_file_name> <output_file_name>

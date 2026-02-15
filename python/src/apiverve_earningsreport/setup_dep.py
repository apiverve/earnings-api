from setuptools import setup, find_packages

setup(
    name='apiverve_earningsreport',
    version='1.1.13',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Earnings Report is a tool for retrieving company financial data including income statement, balance sheet, and cash flow data from SEC filings. It supports lookup by ticker or CIK with optional year and quarter filters.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/earnings?utm_source=pypi&utm_medium=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)

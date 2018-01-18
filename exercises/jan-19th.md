## Task 1.

[source: https://www.tutorialspoint.com/hadoop/hadoop_mapreduce.htm](https://www.tutorialspoint.com/hadoop/hadoop_mapreduce.htm)

the Algorithm
Generally MapReduce paradigm is based on sending the computer to where the data resides!

MapReduce program executes in three stages, namely map stage, shuffle stage, and reduce stage.

Map stage : The map or mapper’s job is to process the input data. Generally the input data is in the form of file or directory and is stored in the Hadoop file system (HDFS). The input file is passed to the mapper function line by line. The mapper processes the data and creates several small chunks of data.

Reduce stage : This stage is the combination of the Shuffle stage and the Reduce stage. The Reducer’s job is to process the data that comes from the mapper. After processing, it produces a new set of output, which will be stored in the HDFS.

During a MapReduce job, Hadoop sends the Map and Reduce tasks to the appropriate servers in the cluster.

The framework manages all the details of data-passing such as issuing tasks, verifying task completion, and copying data around the cluster between the nodes.

Most of the computing takes place on nodes with data on local disks that reduces the network traffic.

After completion of the given tasks, the cluster collects and reduces the data to form an appropriate result, and sends it back to the Hadoop server.

[source: https://github.com/GoogleCloudPlatform/appengine-mapreduce/wiki/1.2-Jobs-and-Stages](https://github.com/GoogleCloudPlatform/appengine-mapreduce/wiki/1.2-Jobs-and-Stages)


## Task 3. Spark vs Hadoop

- Apache Spark is setting the world of Big Data on fire. With a promise of speeds up to 100 times faster than Hadoop MapReduce and comfortable APIs

- How can Spark, an open-source data-processing framework, process data so fast? The secret is that it runs in-memory on the cluster, and that it isn’t tied to Hadoop’s MapReduce two-stage paradigm. This makes repeated access to the same data much faster.

    If Spark runs on Hadoop YARN with other resource-demanding services, or if the data is too big to fit entirely into the memory, then there could be major performance degradations for Spark.

Bottom line: Spark performs better when all the data fits in the memory, especially on dedicated clusters; Hadoop MapReduce is designed for data that doesn’t fit in the memory and it can run well alongside other services.

- Spark has comfortable APIs for Java, Scala and Python, and also includes Spark SQL (formerly known as Shark) for the SQL savvy. Thanks to Spark’s simple building blocks, it’s easy to write user-defined functions. It even includes an interactive mode for running commands with immediate feedback.

- Hadoop MapReduce is written in Java and is infamous for being very difficult to program.

Bottom line: Spark is easier to program and includes an interactive mode; Hadoop MapReduce is more difficult to program but many tools are available to make it easier.

Apache Spark

| (source) |	Apache Hadoop balanced workload slaves
| (source)
Cores	8–16	4
Memory	8 GB to hundreds of gigabytes	24 GB
Disks	4–8	4–6 one-TB disks
Network	10 GB or more	1 GB Ethernet all-to-all

Bottom line: Spark is the Swiss army knife of data processing; Hadoop MapReduce is the commando knife of batch processing.

Spark has retries per task and speculative execution—just like MapReduce. Nonetheless, because MapReduce relies on hard drives, if a process crashes in the middle of execution, it could continue where it left off, whereas Spark will have to start processing from the beginning. This can save time.

Bottom line: Spark and Hadoop MapReduce both have good failure tolerance, but Hadoop MapReduce is slightly more tolerant.

Bottom line: Spark security is still in its infancy; Hadoop MapReduce has more security features and projects.

[source: https://www.xplenty.com/blog/apache-spark-vs-hadoop-mapreduce/](https://www.xplenty.com/blog/apache-spark-vs-hadoop-mapreduce/)

[source: https://www.infoworld.com/article/3014440/big-data/five-things-you-need-to-know-about-hadoop-v-apache-spark.html](https://www.infoworld.com/article/3014440/big-data/five-things-you-need-to-know-about-hadoop-v-apache-spark.html)

# Task 7.

About Cadreon
Cadreon is the advertising tech unit of IPG Mediabrands, the media innovation division of Interpublic Group. Cadreon offers a specialized digital performance platform for media brands that integrates technology, data, and inventory to target audiences in real time. The organization’s solutions are used by many of the world’s top brands to manage and increase the effectiveness of advertising campaigns.

The Challenge
In early 2016, Cadreon sought to develop a new audience-targeting platform that would integrate data from multiple data sources, with the goal of helping media companies maximize the effectiveness of digital advertising campaigns. “We wanted to build a solution that could manage very large datasets—up to 20 billion rows and containing close to a petabyte of data—while also supporting an application to enable real-time data analysis,” says Tushar Patel, senior vice president of engineering for Cadreon.

Cadreon, however, was concerned that using its existing on-premises environment to support the platform would be too challenging. “We only have a few people here to manage an IT environment, and it was already taking up too much of our time,” Patel says. “We want to focus on creating and running new solutions, not managing the backend of it all.”

The company also needed to ensure its new platform could scale to support a potentially fast-growing volume of data, such as demographic data and television-viewing trend data. “We projected a lot of growth for the solution, and we had to have the ability to quickly scale up to support that without investing a lot in hardware and personnel to manage it,” says Patel.

Why Amazon Web Services
As Cadreon considered its technology options, it focused its attention on the cloud. “We saw that the cloud would give us the flexibility to procure new compute resources very quickly and bring them down as needed,” says Bhupen Patel, vice president of data engineering at Cadreon. The company’s search led it to Amazon Web Services (AWS). “AWS is the leader in the cloud space, and we also felt the services from AWS were much more comprehensive than what other providers were offering,” Bhupen Patel says.

Cadreon created its new audience-insights platform on AWS, using the Amazon EMR managed Hadoop framework to process large amounts of data across scalable Amazon Elastic Compute Cloud (Amazon EC2) instances. The company also runs the Apache Spark framework on Amazon EMR and the Druid open-source analytics data store on Amazon EC2 for indexing data. The platform contains a total of 240 TB of data from 11 different advertising sources.

Cadreon runs its audience-insights database on Amazon Relational Database Service (Amazon RDS), and collects television-viewing trends, demographics, and a range of other data in an Amazon Redshift data warehouse. IPG Mediabrands analysts use the solution to conduct advertising-campaign analysis for media customers throughout the world. 

The Benefits
Cadreon was able to easily get its audience-insights platform up and running on the AWS Cloud. “We built and launched this solution very quickly on AWS, and we were able to immediately spin up several hundred instances,” says Tushar Patel. “It would have taken us three months to order the hardware and get it all set up in a data center. Using AWS, we built a sophisticated big-data platform in the cloud that frees us from having to manage the backend environment. We can support 400 instances with only a few people, which we could never do in a traditional environment.”

Leveraging the audience-insights solution, IPG Mediabrands analysts are able to quickly process data for their customers. “Our solution can process big-data queries from thousands of sources in a few seconds, so media companies can better define ad campaigns and audiences. With that data, these companies can target their audience to best achieve the goals of an ad campaign,” says Tushar Patel.

Additionally, Cadreon has the elasticity to scale the platform up or down when necessary. “We get our third-party data on a monthly basis, so we really only need to access and process that a few days each month,” Tushar Patel says. “Using AWS, we can scale the platform up quickly and bring it back down when that time period is over. That saves us both time and money.”

As the platform grows, Cadreon will be able to easily meet demand. “We want to make sure that if this solution takes off in a big way, we can support that growth without compromising the user experience,” says Tushar Patel. “We can definitely do that using AWS. And the fact that we can do it without making a large upfront investment in hardware is a huge advantage for us as a company.”

Cadreon is planning to explore additional AWS services—including Amazon Kinesis—as it expands the platform. “We are always interested in seeing how we can integrate additional AWS services into our platform,” says Tushar Patel. “We want to always keep our focus on building and enhancing our products, and AWS helps us do that more efficiently and cost effectively.”

[source: https://aws.amazon.com/solutions/case-studies/cadreon/](https://aws.amazon.com/solutions/case-studies/cadreon/)
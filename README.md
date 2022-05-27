# friendly

This gem is a part of perl's Data::Friendly library that generates fake data.

It comes in very handy for taking screenshoot, having real-looking test data, and having your database populated with more than one or two records while you're doing development.

## customization

Since you may want to make addresses and other types of data look different depending on where in the world you are (us and uk postal code). set Friendly::Config.locale to the locale you want, and Friendly will take care of the rest.

## usage

```
Friendly::Name.name => "Rendra majed"
Friendly::Internet/email => "raihan.ramses@niceone.gass"
```


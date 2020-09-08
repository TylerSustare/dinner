#!/usr/bin/env node

import cdk = require('@aws-cdk/core');
import { CdkSampleInitStack } from '../lib/cdk-sample-init-stack';
import { RailsNoDbFargateStack } from '../lib/rails-no-db-fargate-stack';

const app = new cdk.App();
const initStack = new CdkSampleInitStack(app, 'CdkSampleInitStack');

// for service :rails_no_db
new RailsNoDbFargateStack(app, 'RailsNoDbFargateStack', {
    vpc: initStack.vpc,
    cluster: initStack.cluster
});


app.synth();
